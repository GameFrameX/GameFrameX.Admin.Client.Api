// GameFrameX 组织下的以及组织衍生的项目的版权、商标、专利和其他相关权利均受相应法律法规的保护。使用本项目应遵守相关法律法规和许可证的要求。
// 
// 本项目主要遵循 MIT 许可证和 Apache 许可证（版本 2.0）进行分发和使用。许可证位于源代码树根目录中的 LICENSE 文件。
// 
// 不得利用本项目从事危害国家安全、扰乱社会秩序、侵犯他人合法权益等法律法规禁止的活动！任何基于本项目二次开发而产生的一切法律纠纷和责任，我们不承担任何责任！

using System.Linq.Expressions;
using GameFrameX.Client.Api.SqlSugar;
using GameFrameX.Entity;

namespace GameFrameX.Client.Api;

/// <summary>
/// 
/// </summary>
public class BaseService
{
}

/// <summary>
/// 
/// </summary>
/// <typeparam name="T"></typeparam>
public class BaseService<T> : BaseService where T : EntityBase, new()
{
    /// <summary>
    /// 
    /// </summary>
    protected readonly Repository<T> Repository;

    /// <summary>
    /// 
    /// </summary>
    /// <param name="settings"></param>
    public BaseService(Repository<T> settings)
    {
        this.Repository = settings;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="filter"></param>
    /// <returns></returns>
    public async Task<T> GetAsync(Expression<Func<T, bool>> filter)
    {
        return await Repository.AsQueryable().Where(m => m.IsDelete == false).FirstAsync(filter);
    }
}