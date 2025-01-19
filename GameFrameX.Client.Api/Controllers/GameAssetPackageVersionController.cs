// GameFrameX 组织下的以及组织衍生的项目的版权、商标、专利和其他相关权利均受相应法律法规的保护。使用本项目应遵守相关法律法规和许可证的要求。
// 
// 本项目主要遵循 MIT 许可证和 Apache 许可证（版本 2.0）进行分发和使用。许可证位于源代码树根目录中的 LICENSE 文件。
// 
// 不得利用本项目从事危害国家安全、扰乱社会秩序、侵犯他人合法权益等法律法规禁止的活动！任何基于本项目二次开发而产生的一切法律纠纷和责任，我们不承担任何责任！

namespace GameFrameX.Client.Api.Controllers;

/// <summary>
/// 资源包版本控制器
/// </summary>
public class GameAssetPackageVersionController : BaseController<ClientAssetPackageVersion>
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="service"></param>
    public GameAssetPackageVersionController(BaseService<ClientAssetPackageVersion> service) : base(service)
    {
    }

    /// <summary>
    /// 获取资源包版本信息
    /// </summary>
    /// <returns></returns>
    [ProducesResponseType(typeof(AssetPackageVersionResponse), 200)]
    [HttpPost]
    public async Task<HttpJsonResult> GetInfo([FromBody] AssetPackageVersionRequest request)
    {
        var response = new AssetPackageVersionResponse();

        var gameResourceVersion = await PBaseService.GetAsync(m =>
                                                                  m.AssetPackageName == request.AssetPackageName
                                                                  && m.Platform == request.Platform
                                                                  && m.Package == request.PackageName
                                                                  && m.AppVersion == request.AppVersion
                                                                  && m.Language == request.Language
                                                                  && m.Channel == request.Channel
                                  );
        if (gameResourceVersion == null)
        {
            gameResourceVersion = await PBaseService.GetAsync(m =>
                                                                  m.AssetPackageName == request.AssetPackageName
                                                                  && m.Platform == request.Platform
                                                                  && m.Package == request.PackageName
                                                                  && m.AppVersion == request.AppVersion
                                                                  && m.Language == request.Language
                                                                  && m.Channel == ConstValue.ChannelNameDefault
                                  );
        }

        if (gameResourceVersion == null)
        {
            gameResourceVersion = await PBaseService.GetAsync(m =>
                                                                  m.AssetPackageName == request.AssetPackageName
                                                                  && m.Platform == request.Platform
                                                                  && m.Package == request.PackageName
                                                                  && m.AppVersion == request.AppVersion
                                                                  && m.Language == ConstValue.LanguageDefault
                                                                  && m.Channel == ConstValue.ChannelNameDefault
                                  );
        }

        if (gameResourceVersion == null)
        {
            gameResourceVersion = await PBaseService.GetAsync(m =>
                                                                  m.AssetPackageName == request.AssetPackageName
                                                                  && m.Platform == request.Platform
                                                                  && m.Package == request.PackageName
                                                                  && m.AppVersion == ConstValue.AppVersionDefault
                                                                  && m.Language == ConstValue.LanguageDefault
                                                                  && m.Channel == ConstValue.ChannelNameDefault
                                  );
        }

        if (gameResourceVersion == null)
        {
            gameResourceVersion = await PBaseService.GetAsync(m =>
                                                                  m.AssetPackageName == request.AssetPackageName
                                                                  && m.Platform == request.Platform
                                                                  && m.Package == ConstValue.PackageNameDefault
                                                                  && m.AppVersion == ConstValue.AppVersionDefault
                                                                  && m.Language == ConstValue.LanguageDefault
                                                                  && m.Channel == ConstValue.ChannelNameDefault
                                  );
        }

        if (gameResourceVersion == null)
        {
            gameResourceVersion = await PBaseService.GetAsync(m =>
                                                                  m.AssetPackageName == request.AssetPackageName
                                                                  && m.Platform == ConstValue.PlatformDefault
                                                                  && m.Package == ConstValue.PackageNameDefault
                                                                  && m.AppVersion == ConstValue.AppVersionDefault
                                                                  && m.Language == ConstValue.LanguageDefault
                                                                  && m.Channel == ConstValue.ChannelNameDefault
                                  );
        }

        if (gameResourceVersion == null)
        {
            return HttpJsonResult.NotFound();
        }

        response.Language = gameResourceVersion.Language;
        response.Platform = gameResourceVersion.Platform;
        response.AssetPackageName = gameResourceVersion.AssetPackageName;
        response.Version = gameResourceVersion.Version;
        response.Channel = gameResourceVersion.Channel;
        response.RootPath = gameResourceVersion.RootPath;
        response.PackageName = gameResourceVersion.Package;
        response.AppVersion = gameResourceVersion.AppVersion;

        return HttpJsonResult.Success(response);
    }
}