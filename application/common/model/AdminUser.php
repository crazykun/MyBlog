<?php
namespace app\common\model;

use think\Model;

/**
 * 管理员模型
 * Class AdminUser
 * @package app\common\model
 */
class AdminUser extends Model
{
    protected $insert = ['created_time'];

    /**
     * 创建时间
     * @return bool|string
     */
    protected function setCreatedTimeAttr()
    {
        return date('Y-m-d H:i:s');
    }
}