// GameFrameX 组织下的以及组织衍生的项目的版权、商标、专利和其他相关权利均受相应法律法规的保护。使用本项目应遵守相关法律法规和许可证的要求。
// 
// 本项目主要遵循 MIT 许可证和 Apache 许可证（版本 2.0）进行分发和使用。许可证位于源代码树根目录中的 LICENSE 文件。
// 
// 不得利用本项目从事危害国家安全、扰乱社会秩序、侵犯他人合法权益等法律法规禁止的活动！任何基于本项目二次开发而产生的一切法律纠纷和责任，我们不承担任何责任！

using GameFrameX.Application.Client.Api.GameAppVersion;

namespace GameFrameX.Client.Api.Controllers;

/// <summary>
/// 程序版本控制器
/// </summary>
public class GameAppVersionController : BaseController<ClientAppVersion>
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="service"></param>
    public GameAppVersionController(BaseService<ClientAppVersion> service) : base(service)
    {
    }

    /// <summary>
    /// 获取游戏版本信息
    /// </summary>
    /// <returns></returns>
    [ProducesResponseType(typeof(GameAppVersionResponse), 200)]
    [HttpPost]
    public async Task<HttpJsonResult> GetInfo([FromBody] GameAppVersionRequest gameAppVersionRequest)
    {
        var response = new GameAppVersionResponse();
        ClientAppVersion gameAppVersion = await PBaseService.GetAsync(m =>
                                                                          m.Platform == gameAppVersionRequest.Platform
                                                                          && m.Package == gameAppVersionRequest.PackageName
                                                                          && m.OldVersion == gameAppVersionRequest.AppVersion
                                                                          && m.Language == gameAppVersionRequest.Language
                                                                          && m.Channel == gameAppVersionRequest.Channel);

        if (gameAppVersion == null)
        {
            gameAppVersion = await PBaseService.GetAsync(m =>
                                                             m.Platform == gameAppVersionRequest.Platform
                                                             && m.Package == gameAppVersionRequest.PackageName
                                                             && m.OldVersion == gameAppVersionRequest.AppVersion
                                                             && m.Language == gameAppVersionRequest.Language
                                                             && m.Channel == ConstValue.ChannelNameDefault);
        }

        if (gameAppVersion == null)
        {
            gameAppVersion = await PBaseService.GetAsync(m =>
                                                             m.Platform == gameAppVersionRequest.Platform
                                                             && m.Package == gameAppVersionRequest.PackageName
                                                             && m.OldVersion == gameAppVersionRequest.AppVersion
                                                             && m.Language == ConstValue.LanguageDefault
                                                             && m.Channel == ConstValue.ChannelNameDefault);
        }

        if (gameAppVersion == null)
        {
            gameAppVersion = await PBaseService.GetAsync(m =>
                                                             m.Platform == gameAppVersionRequest.Platform
                                                             && m.Package == gameAppVersionRequest.PackageName
                                                             && m.OldVersion == ConstValue.AppVersionDefault
                                                             && m.Language == ConstValue.LanguageDefault
                                                             && m.Channel == ConstValue.ChannelNameDefault);
        }

        if (gameAppVersion == null)
        {
            gameAppVersion = await PBaseService.GetAsync(m =>
                                                             m.Platform == gameAppVersionRequest.Platform &&
                                                             m.Package == ConstValue.PackageNameDefault &&
                                                             m.Version == ConstValue.AppVersionDefault &&
                                                             m.Language == ConstValue.LanguageDefault &&
                                                             m.Channel == ConstValue.ChannelNameDefault);
        }

        if (gameAppVersion == null)
        {
            gameAppVersion = await PBaseService.GetAsync(m =>
                                                             m.Platform == ConstValue.PlatformDefault
                                                             && m.Package == ConstValue.PackageNameDefault
                                                             && m.OldVersion == ConstValue.AppVersionDefault &&
                                                             m.Language == ConstValue.LanguageDefault &&
                                                             m.Channel == ConstValue.ChannelNameDefault);
        }

        if (gameAppVersion == null)
        {
            return HttpJsonResult.NotFound();
        }

        response.IsForce = gameAppVersion.IsForce;
        response.IsUpgrade = gameAppVersionRequest.AppVersion != gameAppVersion.Version;
        response.UpdateAnnouncement = gameAppVersion.Announcement;
        response.AppDownloadUrl = gameAppVersion.DownloadUrl;

        return HttpJsonResult.Success(response);
    }
}