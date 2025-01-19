// GameFrameX 组织下的以及组织衍生的项目的版权、商标、专利和其他相关权利均受相应法律法规的保护。使用本项目应遵守相关法律法规和许可证的要求。
// 
// 本项目主要遵循 MIT 许可证和 Apache 许可证（版本 2.0）进行分发和使用。许可证位于源代码树根目录中的 LICENSE 文件。
// 
// 不得利用本项目从事危害国家安全、扰乱社会秩序、侵犯他人合法权益等法律法规禁止的活动！任何基于本项目二次开发而产生的一切法律纠纷和责任，我们不承担任何责任！

namespace GameFrameX.Entity.Client;

[SugarTable(null, "客户端资源包版本")]
public class ClientAssetPackageVersion : EntityBase
{
    /// <summary>
    /// 渠道
    /// </summary>
    [SugarColumn(ColumnDescription = "渠道名称", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string Channel { get; set; }

    /// <summary>
    /// 平台
    /// </summary>
    [SugarColumn(ColumnDescription = "平台", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string Platform { get; set; }

    /// <summary>
    /// 游戏版本
    /// </summary>
    [SugarColumn(ColumnDescription = "游戏版本", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string AppVersion { get; set; }


    /// <summary>
    /// 包名
    /// </summary>
    [SugarColumn(ColumnDescription = "包名", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string Package { get; set; }

    /// <summary>
    /// 语言
    /// </summary>
    [SugarColumn(ColumnDescription = "语言", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string Language { get; set; }

    /// <summary>
    /// 资源包名称
    /// </summary>
    [SugarColumn(ColumnDescription = "资源包名称", Length = 32)]
    [Required, MaxLength(32)]
    public virtual string AssetPackageName { get; set; }

    /// <summary>
    /// 资源下载根路径
    /// </summary>
    [SugarColumn(ColumnDescription = "资源下载根路径", Length = 128)]
    [Required, MaxLength(128)]
    public virtual string RootPath { get; set; }

    /// <summary>
    /// 资源版本
    /// </summary>
    [SugarColumn(ColumnDescription = "资源版本", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string Version { get; set; }

    /// <summary>
    /// 详细描述
    /// </summary>
    [SugarColumn(ColumnDescription = "详细描述", Length = 512)]
    [MaxLength(512)]
    public string Description { get; set; }
}