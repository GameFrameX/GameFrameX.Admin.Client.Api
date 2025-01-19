// GameFrameX 组织下的以及组织衍生的项目的版权、商标、专利和其他相关权利均受相应法律法规的保护。使用本项目应遵守相关法律法规和许可证的要求。
// 
// 本项目主要遵循 MIT 许可证和 Apache 许可证（版本 2.0）进行分发和使用。许可证位于源代码树根目录中的 LICENSE 文件。
// 
// 不得利用本项目从事危害国家安全、扰乱社会秩序、侵犯他人合法权益等法律法规禁止的活动！任何基于本项目二次开发而产生的一切法律纠纷和责任，我们不承担任何责任！

using System.Reflection;
using GameFrameX.Client.Api.Filter;
using GameFrameX.Client.Api.SqlSugar;
using GameFrameX.Core.Options;
using GameFrameX.Entity;
using Microsoft.Extensions.Options;
using Microsoft.OpenApi.Models;
using Yitter.IdGenerator;

namespace GameFrameX.Client.Api;

/// <summary>
/// 
/// </summary>
public static class Program
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="args"></param>
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        var argsList = builder.Configuration.AsEnumerable().ToList();

        Console.WriteLine("环境变量开始");
        Console.WriteLine(string.Join("\n", argsList));
        Console.WriteLine("环境变量结束");


        var launcherOptions = InitLauncherOptions(argsList);

        // 配置雪花ID
        var options = new IdGeneratorOptions(0);
        YitIdHelper.SetIdGenerator(options);
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
        var configuration = builder.Configuration.GetSection(nameof(DbConnectionStrings));


        builder.Services.Configure<DbConnectionStrings>(configuration);
        builder.Services.AddSingleton<DbConnectionStrings>(sp => sp.GetRequiredService<IOptions<DbConnectionStrings>>().Value);
        builder.Services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
        builder.Services.AddHttpClient();
        builder.Services
               .AddControllers(option => { FilterApp.Init(option.Filters); })
               .AddJsonOptions((config) =>
               {
                   // 修改Json 序列化格式为不修改
                   config.JsonSerializerOptions.PropertyNamingPolicy = null;
               });


        SqlSugarClient sqlSugar = AddSqlSugarClientService(configuration, launcherOptions);

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
            app.UseSwagger();
            app.UseSwaggerUI();
        }

// app.UseHttpsRedirection();
        app.MapControllers();
// 设置跨域
        app.UseCors("CorsPolicy");
        app.Run();
    }

    private static LauncherOptions InitLauncherOptions(List<KeyValuePair<string, string>> argsList)
    {
        LauncherOptions launcherOptions = null;
        foreach (var keyValuePair in argsList)
        {
            if (keyValuePair.Key == "DbType")
            {
                if (launcherOptions == null)
                {
                    launcherOptions = new LauncherOptions();
                }

                launcherOptions.DbType = keyValuePair.Value;
            }
            else if (keyValuePair.Key == "ConnectionString")
            {
                if (launcherOptions == null)
                {
                    launcherOptions = new LauncherOptions();
                }

                launcherOptions.ConnectionString = keyValuePair.Value;
            }
        }

        return launcherOptions;
    }

    private static void AddSwaggerService(IServiceCollection service)
    {
        service.AddEndpointsApiExplorer();
        service.AddSwaggerGen(swaggerGenOptions =>
        {
            swaggerGenOptions.SwaggerDoc("v1", new OpenApiInfo { Title = "GameFrameX.Admin.Client.Api", Version = "v1" });

            DirectoryInfo directoryInfo = new DirectoryInfo(AppContext.BaseDirectory);
            var fileList = directoryInfo.GetFiles("*.xml", SearchOption.AllDirectories);
            foreach (FileInfo fileInfo in fileList)
            {
                swaggerGenOptions.IncludeXmlComments(fileInfo.FullName, true);
            }

            swaggerGenOptions.OrderActionsBy(s => s.RelativePath);
        });
    }

    /// <summary>
    /// 添加SqlSugar
    /// </summary>
    /// <param name="configurationSection"></param>
    /// <param name="launcherOptions"></param>
    /// <returns></returns>
    static SqlSugarClient AddSqlSugarClientService(IConfigurationSection configurationSection, LauncherOptions launcherOptions)
    {
        var dbConfig = new ConnectionConfig()
        {
            DbType = Enum.Parse<global::SqlSugar.DbType>(!string.IsNullOrWhiteSpace(launcherOptions.DbType) ? launcherOptions.DbType : (configurationSection["DbType"] ?? global::SqlSugar.DbType.Sqlite.ToString())),
            ConnectionString = !string.IsNullOrWhiteSpace(launcherOptions.ConnectionString) ? launcherOptions.ConnectionString : configurationSection["ConnectionString"],
            IsAutoCloseConnection = true,
        };

        Console.WriteLine("数据库配置信息");
        Console.WriteLine(JsonConvert.SerializeObject(dbConfig, Formatting.Indented));
        Console.WriteLine();
        SqlSugarClient sqlSugarClient = new SqlSugarClient(dbConfig,
                                                           db =>
                                                           {
                                                               // 配置软删除过滤器
                                                               db.QueryFilter.AddTableFilter<IDeletedFilter>(u => u.IsDelete == false);
                                                           });
        return sqlSugarClient;
    }
}