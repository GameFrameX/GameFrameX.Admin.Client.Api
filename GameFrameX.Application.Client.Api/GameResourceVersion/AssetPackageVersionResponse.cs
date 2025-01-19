// GameFrameX 组织下的以及组织衍生的项目的版权、商标、专利和其他相关权利均受相应法律法规的保护。使用本项目应遵守相关法律法规和许可证的要求。
// 
// 本项目主要遵循 MIT 许可证和 Apache 许可证（版本 2.0）进行分发和使用。许可证位于源代码树根目录中的 LICENSE 文件。
// 
// 不得利用本项目从事危害国家安全、扰乱社会秩序、侵犯他人合法权益等法律法规禁止的活动！任何基于本项目二次开发而产生的一切法律纠纷和责任，我们不承担任何责任！

namespace GameFrameX.Application.Client.Api.GameResourceVersion;

/// <summary>
/// 
/// </summary>
public sealed class AssetPackageVersionResponse
{
    /// <summary>
    /// 语言
    /// </summary>
    public string Language { get; set; }

    /// <summary>
    /// 资源版本
    /// </summary>
    public string Version { get; set; }

    /// <summary>
    /// 资源包名称
    /// </summary>
    public string AssetPackageName { get; set; }

    /// <summary>
    /// 平台
    /// </summary>
    public string Platform { get; set; }

    /// <summary>
    /// 下载根路径
    /// </summary>
    public string RootPath { get; set; }

    /// <summary>
    /// 包名
    /// </summary>
    public string PackageName { get; set; }

    /// <summary>
    /// 游戏版本
    /// </summary>
    public string AppVersion { get; set; }

    /// <summary>
    /// 渠道名称
    /// </summary>
    public string Channel { get; set; }
}