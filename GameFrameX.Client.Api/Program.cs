using System.Reflection;
using GameFrameX.Core.Options;
using GameFrameX.Entity;
using GameFrameX.Web.Api;
using GameFrameX.Web.Api.Filter;
using GameFrameX.Web.Api.SqlSugar;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using SqlSugar;

var builder = WebApplication.CreateBuilder(args);

var argsList = builder.Configuration.AsEnumerable().ToList();

Console.WriteLine("环境变量开始");
Console.WriteLine(string.Join("\n", argsList));
Console.WriteLine("环境变量结束");

// 处理启动的URLS
List<string> urls = new List<string>();
foreach (string param in args)
{
    string[] ps = param.Split('=');
    if (ps.Length > 1)
    {
        if (ps[0].Equals("--urls"))
        {
            urls.AddRange(ps[1].Split(";").ToArray());
        }
    }
}

LauncherOptions launcherOptions = new LauncherOptions();

foreach (var valuePair in argsList)
{
    if (valuePair.Key.Equals("DbType"))
    {
        launcherOptions.DbType = valuePair.Value;
    }
    else if (valuePair.Key.Equals("ConnectionString"))
    {
        launcherOptions.ConnectionString = valuePair.Value;
    }
}


if (urls.Count > 0)
{
    builder.WebHost.UseUrls(urls.ToArray());
}

// 配置跨域
builder.Services.AddCors((options) =>
{
    options.AddPolicy("CorsPolicy", (configurePolicy) =>
    {
        //允许所有Origin策略
        configurePolicy.AllowAnyOrigin()
            // 允许任何请求头
            .AllowAnyHeader()
            // 允许任何请求方法
            .AllowAnyMethod().Build();
    });
});
var configuration = builder.Configuration.GetSection(nameof(DBConnectionStrings));
builder.Services.Configure<DBConnectionStrings>(configuration);
builder.Services.AddSingleton<DBConnectionStrings>(sp => sp.GetRequiredService<IOptions<DBConnectionStrings>>().Value);


builder.Services
    .AddControllers(option => { FilterApp.Init(option.Filters); })
    .AddJsonOptions((config) =>
    {
        // 修改Json 序列化格式为不修改
        config.JsonSerializerOptions.PropertyNamingPolicy = null;
    });


SqlSugarClient sqlSugar = AddSqlSugarClientService(configuration);

builder.Services.AddSingleton<ISqlSugarClient>(sqlSugar); // 单例注册
builder.Services.AddScoped(typeof(Repository<>)); // 仓储注册


// 查找实体类.并注册到DI
Assembly assembly = Assembly.GetExecutingAssembly();
foreach (Type type in assembly.GetTypes())
{
    if (type.IsInterface)
    {
        continue;
    }

    if (type.IsSubclassOf(typeof(BaseController)))
    {
        ConstructorInfo[] constructorInfos = type.GetConstructors();
        foreach (ConstructorInfo constructorInfo in constructorInfos)
        {
            foreach (var parameterInfo in constructorInfo.GetParameters())
            {
                if (parameterInfo.ParameterType == typeof(BaseService<>))
                {
                    continue;
                }

                builder.Services.AddScoped(parameterInfo.ParameterType);
            }
        }
    }
}


AddSwaggerService(builder.Services);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    // app.UseSwagger();
    // app.UseSwaggerUI();
}

app.MapControllers();
// 设置跨域
app.UseCors("CorsPolicy");
app.Run();

void AddSwaggerService(IServiceCollection service)
{
// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
    service.AddEndpointsApiExplorer();
    // service.AddSwaggerGen(swaggerGenOptions =>
    // {
    //     swaggerGenOptions.SwaggerDoc("v1", new OpenApiInfo { Title = "HTTP.ClientApi", Version = "v1" });
    //
    //     DirectoryInfo directoryInfo = new DirectoryInfo(AppContext.BaseDirectory);
    //     var fileList = directoryInfo.GetFiles("*.xml", SearchOption.AllDirectories);
    //     foreach (FileInfo fileInfo in fileList)
    //     {
    //         swaggerGenOptions.IncludeXmlComments(fileInfo.FullName, true);
    //     }
    //
    //     swaggerGenOptions.OrderActionsBy(s => s.RelativePath);
    // });
}

SqlSugarClient AddSqlSugarClientService(IConfigurationSection configurationSection)
{
//Scoped用SqlSugarClient 
    var dbConfig = new ConnectionConfig()
    {
        DbType = Enum.Parse<SqlSugar.DbType>(!string.IsNullOrWhiteSpace(launcherOptions.DbType) ? launcherOptions.DbType : (configurationSection["DbType"] ?? SqlSugar.DbType.Sqlite.ToString())),
        ConnectionString = !string.IsNullOrWhiteSpace(launcherOptions.ConnectionString) ? launcherOptions.ConnectionString : configurationSection["ConnectionString"],
        IsAutoCloseConnection = true,
    };

    Console.WriteLine(JsonConvert.SerializeObject(dbConfig));
    SqlSugarClient sqlSugarClient = new SqlSugarClient(dbConfig,
        db =>
        {
            //每次上下文都会执行

            //获取IOC对象不要求在一个上下文
            //vra log=s.GetService<Log>()

            //获取IOC对象要求在一个上下文
            //var appServive = s.GetService<IHttpContextAccessor>();
            //var log= appServive?.HttpContext?.RequestServices.GetService<Log>();

            db.Aop.OnLogExecuting = (sql, pars) => { };
            // 配置软删除过滤器
            db.QueryFilter.AddTableFilter<IDeletedFilter>(u => u.IsDelete == false);
        });
    return sqlSugarClient;
}