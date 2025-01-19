// GameFrameX 组织下的以及组织衍生的项目的版权、商标、专利和其他相关权利均受相应法律法规的保护。使用本项目应遵守相关法律法规和许可证的要求。
// 
// 本项目主要遵循 MIT 许可证和 Apache 许可证（版本 2.0）进行分发和使用。许可证位于源代码树根目录中的 LICENSE 文件。
// 
// 不得利用本项目从事危害国家安全、扰乱社会秩序、侵犯他人合法权益等法律法规禁止的活动！任何基于本项目二次开发而产生的一切法律纠纷和责任，我们不承担任何责任！

using GameFrameX.Application.Client.Api.GlobalInfo;

namespace GameFrameX.Client.Api.Controllers;

/// <summary>
/// 全局信息控制器
/// </summary>
public class GameGlobalInfoController : BaseController<ClientGlobalInfo>
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="service"></param>
    public GameGlobalInfoController(BaseService<ClientGlobalInfo> service) : base(service)
    {
    }

    /// <summary>
    /// 获取全局信息
    /// </summary>
    /// <returns></returns>
    [ProducesResponseType(typeof(GlobalInfoResponse), 200)]
    [HttpPost]
    public async Task<HttpJsonResult> GetInfo([FromBody] GlobalInfoRequest globalInfoRequest)
    {
        var response = new GlobalInfoResponse();
        ClientGlobalInfo gameGlobalInfo = await PBaseService.GetAsync(m =>
                                                                          m.Platform == globalInfoRequest.Platform
                                                                          && m.Package == globalInfoRequest.PackageName
                                                                          && m.Version == globalInfoRequest.AppVersion
                                                                          && m.Language == globalInfoRequest.Language
                                                                          && m.Channel == globalInfoRequest.Channel
                                          );

        if (gameGlobalInfo == null)
        {
            gameGlobalInfo = await PBaseService.GetAsync(m =>
                                                             m.Platform == globalInfoRequest.Platform
                                                             && m.Package == globalInfoRequest.PackageName
                                                             && m.Version == globalInfoRequest.AppVersion
                                                             && m.Channel == globalInfoRequest.Channel
                                                             && m.Language == ConstValue.LanguageDefault
                             );
        }

        if (gameGlobalInfo == null)
        {
            gameGlobalInfo = await PBaseService.GetAsync(m =>
                                                             m.Platform == globalInfoRequest.Platform
                                                             && m.Package == globalInfoRequest.PackageName
                                                             && m.Version == globalInfoRequest.AppVersion
                                                             && m.Language == ConstValue.LanguageDefault
                                                             && (m.Channel == ConstValue.ChannelNameDefault || m.Channel == globalInfoRequest.Channel)
                             );
        }

        if (gameGlobalInfo == null)
        {
            gameGlobalInfo = await PBaseService.GetAsync(m =>
                                                             m.Platform == globalInfoRequest.Platform
                                                             && m.Package == globalInfoRequest.PackageName
                                                             && m.Version == ConstValue.AppVersionDefault
                                                             && m.Language == ConstValue.LanguageDefault
                                                             && (m.Channel == ConstValue.ChannelNameDefault || m.Channel == globalInfoRequest.Channel)
                             );
        }

        if (gameGlobalInfo == null)
        {
            gameGlobalInfo = await PBaseService.GetAsync(m =>
                                                             m.Platform == globalInfoRequest.Platform
                                                             && m.Package == ConstValue.PackageNameDefault
                                                             && m.Version == ConstValue.AppVersionDefault
                                                             && m.Language == ConstValue.LanguageDefault
                                                             && (m.Channel == ConstValue.ChannelNameDefault || m.Channel == globalInfoRequest.Channel)
                             );
        }

        if (gameGlobalInfo == null)
        {
            gameGlobalInfo = await PBaseService.GetAsync(m =>
                                                             m.Platform == ConstValue.PlatformDefault
                                                             && m.Package == ConstValue.PackageNameDefault
                                                             && m.Version == ConstValue.AppVersionDefault
                                                             && m.Language == ConstValue.LanguageDefault
                                                             && (m.Channel == ConstValue.ChannelNameDefault || m.Channel == globalInfoRequest.Channel)
                             );
        }

        if (gameGlobalInfo == null)
        {
            return HttpJsonResult.NotFound();
        }

        response.Content = gameGlobalInfo.Content;
        response.CheckAppVersionUrl = gameGlobalInfo.CheckAppVersionUrl;
        response.CheckResourceVersionUrl = gameGlobalInfo.CheckResourceUrl;
        response.AotCodeList = gameGlobalInfo.AotCodeList;
        return HttpJsonResult.Success(response);
    }
}