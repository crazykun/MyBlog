<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Cache;
use think\Db;

/**
 * 系统配置
 * Class System
 * @package app\admin\controller
 */
class System extends AdminBase
{
    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 站点配置
     */
    public function siteConfig()
    {
        $list = Db::name('system')->where('status', 0)->select();
        $site_config=[];
        foreach ($list as $key => $value) {
            $site_config[$value['name']] = $value['value'];
        }
        return $this->fetch('site_config', ['site_config' => $site_config]);
    }

    /**
     * 更新配置
     */
    public function updateSiteConfig()
    {
        if ($this->request->isPost()) {
            $site_config = $this->request->post('site_config/a');
            $systemModel      = Db::name('system');
            foreach ($site_config as $k => $v) {
                $currentData = array();
                $currentData['value'] = $v;
                $status = $systemModel->where('name = "'.$k.'"')->update($currentData);
                if($status === false){
                    $this->error('修改失败！');
                }
            }
            $this->success("提交成功");
        }
    }

    /**
     * 清除缓存
     */
    public function clear()
    {
        if (delete_dir_file(CACHE_PATH) || delete_dir_file(TEMP_PATH)) {
            $this->success('清除缓存成功');
        } else {
            $this->error('清除缓存失败');
        }
    }
}