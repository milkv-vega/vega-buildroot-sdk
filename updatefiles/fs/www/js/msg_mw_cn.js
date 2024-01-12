//  shared  messages - used in more than 1 file
var msg_blank = "%s不能为空.\n";
var msg_space = "Blanks or spaces are not allowed in %s\n";
var msg_invalid = "%s无效，请重新输入!\n";
var msg_check_invalid = "%s包含非法字符\n";
var msg_valid_range = "%s范围异常. 有效的变化范围是从 %s 到 %s!\n";
var msg_first = "First";  // eg. First field of GW must match device IP
var msg_invalid_mac = "%s is invalid. A MAC address must be 12 Hex chars with optional delimiters (: or -)\n";
var msg_multi_mac="The MAC address can't be multicast address.\n";
var msg_invalid_ip = "IP地址不合法, 请重新输入.\n";
var msg_invalid_gw =  "Invalid Gateway, please enter again.\n";
var msg_invalid_mask = "Invalid Subnet Mask, please enter again.\n";
var msg_nameNULL = "The name can not be blank.\n";
var msg_invalid_email = "%s无效.\n";
var msg_invalid_host = "%s域名无效.\n";
var msg_invalid_input = "%s只允许为32个字节英文，数字和汉字的混合(汉字为双字节)!\n";
var msg_invalid_num = "%s只允许为不超过16个字符英文，数字的混合!\n";
var msg_invalid_oid = "%s格式不合法或者包含非法字符.\n";

//reboot
var msg_no_ip = "设备20秒内无法获得IP地址，请检查网络上是否存在DHCP服务器!";

//config
var msg_reboot = "所有的网络连接即将被中断.\n\n是否继续?";
var msg_nofile = "没有选择文件. 请选择正确的文件.\n";
var msg_errfiletype = "文件类型不正确. 请选择正确的文件.\n";
//var msg_null_filename = "文件名不能为空.\n";
var msg_confirmCfile = "警告!\n上传配置文件将导致以前的配置被覆盖.\n请确认是否进行该操作?";
var msg_confirmDefault = "警告!\n恢复出厂配置文件将导致以前的配置被覆盖.\n如果没有勾选\"保留当前ip设置\"则出厂设置的默认IP地址是\"%s\".\n请确认是否进行该操作?";
var msg_confirmUpgrade = "警告!\n固件升级过程中请勿切断设备电源或者中断和设备之间的网络连接.\n 升级完成后设备将重启.\n请确认是否进行该操作?";

//ip.html
var msg_ip = "IP地址";
var msg_mask = "子网掩码";
var msg_gw = "默认网关";
var msg_dns = "DNS地址";
var msg_dns_warning = "警告: DNS地址为空，某些需要域名服务的功能将无法使用!\n";
var msg_ip_gw_mismatch = "IP地址%s和网关%s不在同一网段, 请重新输入!\n";

//user
var msg_name = "用户名";
var msg_Passwd = "密码";
var msg_ConfirmPasswd = "确认密码";
var msg_nosame_Passwd = "密码和确认密码不匹配，请确认输入!\n";
var msg_noadmin_Passwd = "管理员的用户名和密码不能为空!\n";
var msg_user_name = "%s只允许为16个字节英文，数字，下划线和空格的混合!\n";
var msg_user_password="用户密码必须不少于5位，且只能为数字，字母或特殊字符的组合!\n";
var msg_relogin = "系统检测到当前登录用户名已更改，设置完成后需重新登录.";
var msg_samename = "系统检测到当前登录用户名已经使用，请重新设置！\n";
var msg_nousername = "用户名和密码不允许为空!\n";

//system
var msg_device_name = "设备名称";
var msg_device_loc = "设备位置";

var msg_device_sn = "设备编号";
var msg_device_desp = "设备描述";
var msg_device_loc = "设备位置";
var msg_device_cont = "联系信息";
var msg_invalid_cont = "%s只允许为16个字节英文,数字,\'.\',\'@\'和汉字的混合(汉字为双字节)!\n";

//igmp
var msg_igmp_interval = "IGMP 查询间隔时间";
var msg_igmp_age = "组成员生存时间";

//Port Mirroring
var mirror_msg = "请至少选择一个被镜像端口!\n";
var mirror_repeat = "被镜像端口和镜像端口不可以是同一端口!\n";
var msg_mirror_port_disabled = "您选择的镜像端口已经被禁用, 请重新选择!\n";
var msg_capture_port_disabled = "您选择的被镜像端口已经被禁用, 请重新选择!\n";
var msg_mirror_trunk_exclusion = "端口汇聚功能已开启, 请关闭端口汇聚功能!\n";
var msg_capture_port_trunk = "端口%s已经被作为汇聚端口！\n";
var msg_capture_port_lacp = "端口%s已经被作为LACP端口！\n";
var msg_mirror_disable_lacp = "端口%s已被作为LACP端口！\n";

//fwd
var fwd_err_mac = "MAC地址不合法，请确认后重新输入!\n";
var msg_forward_bpdu = "保留的以太网桥管理MAC地址不可以设置!\n";
var msg_forward_multi = "保留的多播组管理MAC地址不可以设置!\n";
var msg_forward_host = "本管理型交换机的MAC地址不可以设置!\n";
var msg_no_fwd_port = "多播地址中必须选择至少一个转发端口!\n";

//access.html
var msg_access_first = "第";
var msg_access_mod = "组地址栏中";
var msg_incorrect_ip = "IP地址无效!\n";
var msg_repeat_ip = "IP地址重复!\n";
var msg_http_access = "WEB服务器传输应至少选择一种传输协议!\n";
var msg_ip_input = "如果启用了用户登陆控制, IP地址表不能为空!\n";
var msg_deny_pc = "当前PC的IP不在允许登录列表将导致不能访问该交换机, 是否继续?";
var msg_not_samemask = "设置无效，当前允许访问交换机的IP地址与本机IP地址不在同一网段内。";

// email.htm
var msg_mail_server = "邮件服务器地址";
var msg_mail_user = "邮件帐号";
var msg_mail_passwd = "邮件帐号密码";
var msg_email_in = "收件人地址";
var msg_email_re = "邮件回复地址";

// Diagnostics.htm
var msg_ping_addr = "目的地址";
var msg_ping_size = "报文大小";
var msg_ping_number = "报文数目";
var msg_ping_interval = "报文间隔";
var msg_ping_timeout = "应答超时";
var msg_invalid_ipaddr = "%sIP地址不合法, 请重新输入.\n";
var msg_invalid_domain = "%s域名不合法, 请重新输入.\n";

//trunk
var msg_trunking_least = "第%s组汇聚设置至少需要1个端口!\n";
var msg_trunking_most = "第%s组汇聚设置至多可以有%s个端口!\n";
var msg_trunking_port_disabled = "在第%sTRUNK端口组中，有TRUNK端口已经被禁用!\n";
var msg_trunking_port = "第%s组汇聚组和第%s组汇聚组中端口重叠!\n";
var msg_trunking_port_edit="在汇聚组\%s中，有TRUNK端口的配置未保持完全一致，无法进行汇聚!\n";
var msg_trunking_port_inconformity="在汇聚组\%s中，有TRUNK端口的端口类型未保持完全一致，无法进行汇聚!\n";
var msg_trunking_port_ring="在汇聚组\%s中，有TRUNK端口已经被作为环网端口!\n";
var msg_trunking_port_rstp="在汇聚组\%s中，有TRUNK端口已经被作为RSTP端口!\n";
var msg_trunking_port_erps="在汇聚组\%s中，有TRUNK端口已经被作为ERPS端口!\n";
var msg_trunking_port_loopback="在汇聚组\%s中，有TRUNK端口已经被作为环回检测端口!\n";
var msg_trunk_mirror_exclusion = "端口镜像功能已开启, 请关闭端口镜像功能!\n";
var msg_trunk_qvlan_exclusion = "802.1Q vlan功能已开启, 请关闭802.1Q vlan功能!\n";
var msg_trunk_default_pvlan_exclusion = "端口vlan非默认配置, 请配置端口vlan为默认值!\n";
var msg_trunk_vlan_mode_conflict = "汇聚组%s中的端口VLAN模式不同，不能加入同一汇聚组!\n";
var msg_trunk_vlan_allow_conflict = "汇聚组%s中端口允许通过的VLAN列表不同，不能加入同一汇聚组!\n";
var msg_trunk_vlan_untag_conflict = "汇聚组%s中端口出口不打标记的VLAN列表不同，不能加入同一汇聚组!\n";
var msg_trunking_port_disable_lacp = "汇聚组%s中端口%s已被作为LACP端口\n";
var msg_trunking_disable_lacp = "汇聚组%s已被LACP使用\n!";
//protect port
var msg_protect_port = "被保护的端口至少需要设置2个端口!\n";

//SNMP
var msg_snmpdevice_name = "SNMP设备名称";
var msg_snmp_get_comm = "SNMP只读通信字符串";
var msg_snmp_set_comm = "SNMP读写通信字符串";
var msg_invalid_snmp_trap = "SNMP TRAP管理网关不是有效IP地址!\n";
var msg_snmp_view_nme = "视图名";
var msg_snmp_view_oid = "OID子树";
var msg_snmp_comm_name = "共同体名";
var msg_snmp_user_name = "用户名";
var msg_snmp_user_authpasswd = "认证密码";
var msg_snmp_trap_ip = "trap网关IP地址";



//rstp
var rstp_hello_time = "RSTP轮询间隔";
var rstp_forward_delay = "RSTP转发延迟";
var rstp_max_age = "RSTP最大老化时间";
var rstp_delay_max_age = "RSTP中: 2 *（转发延迟 - 1.0) >= 最大老化时间\n";
var rstp_max_age_hello = "RSTP中: 最大老化时间 >= 2 *（轮询间隔 + 1.0)";
var rstp_port_cost = "路径开销";
var rstp_port_war = "第%s端口";
var rstp_port_trunk = "在RSTP中，端口 %s 已经被作为TRUNK端口!\n";
var rstp_port_loopback = "端口%s启用了端口环回检测功能！\n";
var rstp_port_lacp = "端口%s已经被作为LACP端口！\n";
//VLAN
var msg_pvlan_name = "端口VLAN名称";
var msg_qvlan_index = "802.1Q VLAN ID";
var msg_qvlan_pvid = "802.1Q 端口VLAN ID";
var msg_qvlan_drop_port = "您已经将所有的通讯端口选择了丢弃无tag的帧,这样可能会导致无法与交换机通讯.\n确定要执行此操作吗?";
var msg_no_member = "转发表项中必须选择至少两个转发端口!\n";
var msg_pvlan_max_member="端口VLAN最多可以增加32个表项!\n";
var msg_qvlan_max_member="802.1Q VLAN最多可以增加64个表项!\n";
var msg_valn_fwd_member="端口%s没有被安排到某个转发规则中!\n";
var msg_valn_warning="端口%s中";
var msg_vlan_port_alluse="所有端口都已经被安排到转发规则中!";
var msg_qvlan_pvid = "802.1Q 端口VLAN ID必须满足条件：1<=VID<=4094!\n";
var msg_vtrunk_vlan = "VLAN列表不能为空!\n";
var msg_vtrunk_vid_error = "请输入正确的 VLAN ID 范围!\n";
var msg_vtrunk_vlist_null = "VLAN Trunk列表为空!\n";
var msg_vtrunk_del_dou = "VLAN 列表中 开始或者末尾不能有逗号!\n";
var msg_vtrunk_port_null = "请至少选择一个VLAN Trunk端口!\n";
var msg_vtrunk_mport_null = "请至少选择一个VLAN 管理端口!\n";
var msg_vtrunk_port_error = "VLAN Trunk端口与管理端口有重叠!\n";
var msg_vlan_choose_port = "请选择划分VLAN的端口！";
var msg_vtrunk_port_repeat = "检测到Vlan trunk列表输入的范围间有冲突，或者输入错误请按规则重新输入!\n";
var msg_vtrunk_manager_port_disabled = "VLAN TRUNK管理端口已经被禁用!\n";
var msg_vtrunk_port_disabled = "您所选择的VLAN TRUNK端口已经被禁用!\n";
var msg_vlan_adv_enable = "如果802.1q vlan 高级设置已经启用，由于PVID可能导致本机与交换机无法通讯，\n你确信要执行此操作吗?";
var msg_vlan_mode_pvid_error = "在Access模式下，端口\%s的PVID输入错误，必须在其已划分的VLAN中!\n";
var msg_enable_vlan_exclusion_trunk = "汇聚功能已开启，请关闭!\n";
var msg_no_select_port = "端口未选择！\n";

//VLAN Hybrid
var msg_vlan_access_error="端口%s是Access端口，它允许通过的VLAN有且只有一个，范围为1~4094！\n"
var msg_vlan_pvid_error="端口%s的PVID有误，PVID取值范围为1~4094，且只能为端口允许通过的VLAN中的一个！\n";
var msg_vlan_allow_error="端口%s的'允许通过的VLAN列表'配置值有误，请按照格式重新配置且不能超过%s条！\n";
var msg_vlan_tag_error="端口%s的'出口不打标记的VLAN列表'配置值的格式有误，请重新配置！\n";
var msg_vlan_tag_error_hybrid="端口%s的'出口不打标记的VLAN列表'配置值不在'允许通过的VLAN列表'配置值范围内，请重新配置！\n";
var msg_vlan_manage_vlan_range_error="管理VLAN";
var msg_set_manage_vlan_error = "至少要有一个口，允许管理Vlan通过！";
var msg_erps_enable_pvlan="ERPS功能已开启，无法开启基于端口的VLAN，请确认!\n";
var msg_erps_protocol_vlan="VLAN \%s 已作为ERPS的协议VLAN，无法创建！\n";
var msa_qvlan_allow_trunk_conflict = "端口%s为汇聚端口，不能修改其允许通过的VLAN列表!\n";
var msa_qvlan_untag_trunk_conflict = "端口%s为汇聚端口，不能修改其出口不打标记的VLAN列表!\n";
var msa_qvlan_mode_trunk_conflict = "端口%s为汇聚端口，不能修改其VLAN端口模式!\n";

//ip acl
var msg_src_port_err = "源端口号范围错误,请重新输入！\n";
var msg_dst_port_err = "目的端口号范围错误,请重新输入！\n";
var msg_l4portrange_overlap_err = "源/目的端口号范围不能重叠,请重新输入！\n";
var msg_l4portrange_resource_err = "仅支持4条源/目的端口号范围匹配规则！\n";

//seep setting
var msg_speed_warning="必须有一个以上的端口被启动，否则将下次无法通过Web配置交换机!\n";

//ring
var msg_ring = "Ring";
var msg_ring_id = "快速环网标识";
var msg_double_ring = "快速环网组%s的双臂环应该使用且仅使用两个端口!\n";
var msg_single_ring = "快速环网组%s的双臂环应该使用且仅使用一个端口!\n";
var msg_ring_repeat = "快速环网组%s和%s使用的端口重复,请确认!\n";
var msg_ring_repeat_id_error = "快速环网组%s和%s使用的端口重复,请使用%s作为环间耦合id!\n";
var msg_ring_id_repeat = "快速环网组%s和%s的网络标识重复,请确认!\n";
var msg_ring_id_error = "%s < ring id < %s !\n";
var msg_ring_port_disabled = "在第%s环网组中，有环网端口已经被禁用!\n";
var msg_ring_trunk_port_disabled = "在第4环网组中，耦合端口已经被禁用!\n";
var msg_ring_trunk_collision = "%s\n不能同时作为环网端口和汇聚端口!\n";
var msg_ring_port_trunk = "在快速环网组%s中，已有快速环网端口被作为TRUNK端口!\n";
var msg_ring_trunk_coupling = "在第4环网组中，耦合端口已经被作为TRUNK端口!\n"
var msg_ring_port_err = "快速环网组%s的环端口重复，请确认!\n";
var msg_ring_vlan_err = "数据VLAN配置值有误，请按照格式重新配置!\n";

//erps
var msg_erps_duplicate = "环网组%s和%s使用的环ID重复,请确认!\n";
var msg_erps_id_error = "环网组%s和%s使用的数据VLAN重复,但是ERPS ID不同,请确认!\n";
var msg_erps_vlan_duplicate = "环网组%s和%s使用的协议VLAN重复,请确认!\n";
var msg_data_vlan_error = "管理vlan不在任何一个环网组的数据vlan之中";
var msg_diff_erps_port_duplicate = "环网组%s和%s使用的ERPS ID和端口一样,请确认!\n";
var msg_erps_port_duplicate = "环网组%s的环端口重复,请确认!\n";
var msg_erps_major_port = "环网组%s的环类型为主环，主环的东西端口均不能为none!\n";
var msg_erps_port = "环网组%s的东西端口不能都为none!\n";
var msg_erps_vlan = "环网组%s的协议vlan和环网组%s数据vlan重复!\n";
var msg_erps_def_mac = "当前节点所有已启用的环网组的协议报文目的mac地址必须相同!\n";
var msg_belong_major = "环网组%s配置为互联节点，其所属主环在当前节点不存在，请确认!\n";
var msg_erps_port_disabled = "在环网组%s中，有环网端口已经被禁用!\n";
var msg_erps_enable = "当前配置中无任何环网组启用，请确认!\n";
var msg_sub_belong_error = "在环网组%s中，子环的所属主环为它本身，请确认!\n";
var msg_erps_port_trunk = "在环网组%s中，有环网端口已经被作为TRUNK端口!\n";
var msg_vlan_type="开启ERPS时，VLAN类型需设置为802.1Q模式，请确认后重试!\n";
var msg_protocol_vlan= "环网组\%s的协议VLAN已创建，请重新选择未创建的VLAN作为协议VLAN!\n";
var msg_erps_disable_storm = "环网组%s中，有环网端口已经被作为风暴检测端口！\n";
var msg_erps_disable_rstp = "RSTP功能正在运行，无法开启ERPS！\n";
var msg_erps_disable_lacp = "环网组%s中，环网端口%s已经被作为LACP端口！\n"

//NTP
var msg_time_server = "时间同步服务器地址";

//AUTH
var msg_auth_name = "认证用户名";
var msg_auth_pass = "认证用户密码";
var msg_auth_max_member="IEEE 802.1X 认证最多可以增加128个用户!\n";
var msg_auth_null = "认证数据库内的用户不能为空!\n"
var msg_reauth = "IEEE 802.1X 重新认证时间";
var msg_radius = "IEEE 802.1X 认证服务器";
var msg_AAA = "IEEE 802.1X 计费服务器";
var msg_radius_port = "IEEE 802.1X 认证服务器端口";
var msg_AAA_port = "IEEE 802.1X 计费服务器端口";
var msg_invalid_key = "认证服务器的共享密码只允许为不大于64个字节且不小于6字节的英文，数字和汉字的组合!\n";

//lock
var msg_max_mul = "静态组播MAC地址表最多只可以增加512个表项!\n";
var msg_max_lock = "静态单播锁存地址表最多只可以增加512个表项!\n";
var msg_mul_lock = "静态单播锁存地址表不可以加入多播或广播地址!\n";
var msg_uni_igmp = "静态多播MAC地址表不可以加入单播或广播地址\n";
var msg_mac_ob     = "组播地址超出范围";

//storm
var msg_storm_pkts = "请至少选择一种限制类型!\n";

//mac.html
var msg_oidtime_error = "MAC地址老化时间应该满足条件:\n%s<=老化时间<=%s";
var msg_oidtime_numerror = "请输入正确的整数!";

//speed
var msg_speed_disable_ring = "你所禁用的端口目前正在作为环网端口\n";
var msg_speed_disable_vlantrunk = "你所禁用的端口目前正在作为VLAN TRUNK端口!\n";
var msg_speed_disable_vlantrunk_manager = "你所禁用的端口目前正在作为VLAN TRUNK功能的管理端口!\n";
var msg_speed_disable_trunk = "你所禁用的端口目前正在作为TRUNK端口!\n";
var msg_speed_disable_mirror = "你所禁用的端口目前正在作为镜像端口!\n";
var msg_speed_disable_mirror_capture = "你所禁用的端口目前正在作为采集端口!\n";
var msg_speed_disable_tail = "请先关闭这些端口正在使用的功能!\n";
var msg_speed_edit_trunk="你所修改的端口设置目前正在作为TRUNK端口!TRUNK端口的配置必须保持一致!\n";
var msg_speed_disable_lacp = "你所禁用的端口%s目前正在作为LACP端口\n";



var msg_upgrade_status = "系统正在升级，已升级(%s/3)，请勿断电或者对交换机做任何操作，整个升级过程大约需要1到2分钟。";
var msg_set_for_reboot = "操作成功，交换机正在重启中...";
//copyright
var msg_copyright = "版权所有&copy;仿冒必究&nbsp;2012-2022&nbsp;";

//lacp
var msg_lacp_disable_trunk = "LACP不能与端口汇聚同时开启，请先关闭端口汇聚功能！\n";
var msg_lacp_disable_trunk_group = "汇聚组%s已被使用!\n";
var msg_lacp_duplicate_trunk_group = "编号%s和%s的汇聚组重复!\n";
var msg_lacp_disable_lacp_group = "端口%s的汇聚组ID%s未启用\n";
var msg_lacp_disable_speed = "端口%s被禁用\n";
var msg_lacp_disable_rstp = "端口%s已经被作为RSTP端口\n";
var msg_lacp_disable_erps = "端口%s已经被作为ERPS端口\n";
var msg_lacp_disable_trunk_port = "端口%s已经被作为TRUNK端口\n";
var msg_lacp_disable_mirror = "端口%s已经被作为镜像端口\n";
