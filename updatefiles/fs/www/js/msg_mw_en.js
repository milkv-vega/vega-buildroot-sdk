//  shared  messages - used in more than 1 file
var msg_blank = "%s can't be blank.\n";//"%s不能为空.\n";
var msg_space = "Blanks or spaces are not allowed in %s\n";
var msg_invalid = "%s is invalid, please input again.\n";//"%s无效，请重新输入!\n";
var msg_check_invalid = "%s contains invalid characters.\n";//"%s包含非法字符\n";
var msg_valid_range = "%s is invalid, the valid scope ranges from %s to %s.\n";//"%s范围异常. 有效的变化范围是从 %s 到 %s!\n";
var msg_first = "First";  // eg. First field of GW must match device IP
var msg_invalid_mac = "%s is invalid. A MAC address must be 12 Hex chars with optional delimiters (: or -)\n";
var msg_multi_mac="The MAC address can't be multicast address.\n";
var msg_invalid_ip = "IP is invalid, please input again.\n";//"IP地址不合法, 请重新输入.\n";
var msg_invalid_gw =  "Invalid Gateway, please enter again.\n";
var msg_invalid_mask = "Invalid Subnet Mask, please enter again.\n";
var msg_nameNULL = "The name can not be blank.\n";
var msg_invalid_email = "%s is invalid.\n";//"%s无效.\n";
var msg_invalid_host = "the domain named %s is invalid.\n";//"%s域名无效.\n";
var msg_invalid_input = "%s must be consisted by letters,numbers or chinese, and can not more than 32 bytes.\n";//"%s只允许为32个字节英文，数字和汉字的混合(汉字为双字节)!\n";
var msg_invalid_num = "%s must be consisted by letters or numbers, and can not more than 16 bytes.\n";//"%s只允许为16个字节英文，数字的混合!\n";
var msg_invalid_oid = "%s format is illegal or contains illegal characters.\n";

//reboot
var msg_no_ip = "The device can't get IP in 20 seconds, please checking whether the DHCP server exists or not.\n";//"设备20秒内无法获得IP地址，请检查网络上是否存在DHCP服务器!";

//config
var msg_reboot = "All the network will be interrupted, do you want to continue?\n";//"所有的网络连接即将被中断.\n\n是否继续?";
var msg_nofile = "No file are chosen, please choose the right file.\n";//"没有选择文件. 请选择正确的文件.\n";
var msg_errfiletype = "The file type is incorrect. Please select the correct file.\n";//"文件类型不正确. 请选择正确的文件.\n";
//var msg_null_filename = "文件名不能为空.\n";
var msg_confirmCfile = "WARNING!\nThis operation will cover the old configure, do you want to continue?\n";//"警告!\n上传配置文件将导致以前的配置被覆盖.\n请确认是否进行该操作?";
var msg_confirmDefault = "WARNING!\nThis operation will cover the old configure, if you donot choose \"Retain The Current Configuration of IP\" then the default IP will become %s.\nDo you want to continue?\n";//"警告!\n恢复出厂配置文件将导致以前的配置被覆盖.\n出厂设置的默认IP地址是\"192.168.16.253\".\n请确认是否进行该操作?";
var msg_confirmUpgrade = "WARNING!\nDo not turn off the power or the link between host and device.\nThe device will reboot after upgrading.\nDo you want to continue?\n";//"警告!\n固件升级过程中请勿切断设备电源或者中断和设备之间的网络连接.\n 升级完成后设备将重启.\n请确认是否进行该操作?";

//ip.html
var msg_ip = "IP Address";//"IP地址";
var msg_mask = "Subnet Mask";//"子网掩码";
var msg_gw = "Default Gateway";//"默认网关";
var msg_dns = "DNS";
var msg_dns_warning = "WARNING!\nDNS is blank, the functions that use the DNS may not be valid.\n";//;"警告: DNS地址为空，某些需要域名服务的功能将无法使用!\n";
var msg_ip_gw_mismatch = "%s and %s are not in a segment of net, please input again.\n";//"IP地址%s和网关%s不在同一网段, 请重新输入!\n";

//user
var msg_name = "user name";//"用户名";
var msg_Passwd = "password";
var msg_ConfirmPasswd = "passwords";
var msg_nosame_Passwd = "password and passwords are different,please input again.\n";
var msg_noadmin_Passwd = "The manager's name and password can't be blank.\n";//"管理员的用户名和密码不能为空!\n";
var msg_user_name = "%s must be consisted by letters, numbers, underline or space, and can not more than 16 bytes.\n";//"%s只允许为16个字节英文，数字，下划线和空格的混合!\n";
var msg_user_password="The password must consist of letters, numbers or special characters, and can not be less than 5 bytes!\n";//"用户密码必须不少于5位，且只能为数字，字母或特殊字符的组合!\n";
var msg_relogin = "The device detects the current user name has been changed, please sign in again after this operation.\n";//"系统检测到当前登录用户名已更改，设置完成后需重新登录.";
var msg_samename = "The device detects the current user name has been used, please input other username.\n ";//"系统检测到当前登录用户名已经使用，请重新设置！\n"
var msg_nousername = "The username and password can't be blank.\n";//"用户名和密码不允许为空!\n";
//system
var msg_device_name = "Device Name";//"设备名称";
var msg_device_sn = "Device SN";//"设备编号";
var msg_device_desp = "Device Description";//"设备描述";
var msg_device_loc = "Device Location";//"设备位置";
var msg_device_cont = "Contact Information";//"联系信息";
var msg_invalid_cont = "%s must be consisted by letters ,\'.\',\'@\', numbers or chinese,and can not more than 16 bytes.\n";//"%s只允许为16个字节英文,数字,\'.\',\'@\'和汉字的混合(汉字为双字节)!\n";

//igmp
var msg_igmp_interval = "Query interval time of IGMP.\n";//"IGMP 查询间隔时间";
var msg_igmp_age = "Survival time of group members.\n";//"组成员生存时间";

//Port Mirroring
var mirror_msg = "Please do choose a mirrored port at least.\n";//"请至少选择一个监控端口!\n";
var mirror_repeat = "The mirrored port and the mirror port can not be the same.\n";//"监控端口和镜像端口不可以是同一端口!\n";
var msg_mirror_port_disabled = "The mirror ports you choose has been disabled,please choose again.\n";//"您选择的镜像端口已经被禁用, 请重新选择!\n";
var msg_capture_port_disabled = "The mirrored ports you choose has been disabled,please choose again.\n";//"您选择的采集端口已经被禁用, 请重新选择!\n";
var msg_mirror_trunk_exclusion = "The port trunking has been opened, please close it!"//"端口汇聚功能已开启, 请关闭端口汇聚功能!\n";
var msg_capture_port_trunk = "The ports %s is trunk ports.\n";//"端口%s已经被作为汇聚端口！\n";
var msg_capture_port_lacp = "The ports %s is lacp ports.\n";//"端口%s已经被作为LACP端口！\n";
var msg_mirror_disable_lacp = "The ports %s is lacp ports.\n";//"端口%s已经被作为LACP端口！\n";

//fwd
var fwd_err_mac = "MAC is invalid, please confirm and input again.\n";//"MAC地址不合法，请确认后重新输入!\n";
var msg_forward_bpdu = "The reserved etheric bridge management MAC address can't be set.\n";//"保留的以太网桥管理MAC地址不可以设置!\n";
var msg_forward_multi = "The reserved multicast group management MAC address can't be set.\n";//"保留的多播组管理MAC地址不可以设置!\n";
var msg_forward_host = "The MAC of this device can't be set again.\n";//"本管理型交换机的MAC地址不可以设置!\n";
var msg_no_fwd_port = "Do choose a forwarding port at least.\n";//"多播地址中必须选择至少一个转发端口!\n";

//access.html
var msg_access_first = "";//"第";
var msg_access_mod = "group address";//"组地址栏中";
var msg_incorrect_ip = "IP is invalid";//"IP地址无效!\n";
var msg_repeat_ip = "IP addresses repeat.\n";//"IP地址重复!\n";
var msg_http_access = "WEB server transmission should choose a transmission protocol at least.\n";//"WEB服务器传输应至少选择一种传输协议!\n";
var msg_ip_input = "If user access control is enabled, IP can't be blank.\n";//"如果启用了用户登陆控制, IP地址表不能为空!\n";
var msg_deny_pc = "The IP of current computer is not in the list which records the allowed devices, do you want to continue.\n";//"当前PC的IP不在允许登录列表将导致不能访问该交换机, 是否继续?";
var msg_not_samemask = "Invalid IP.The access IP and switch IP is not under the same gateway.";

// email.htm
var msg_mail_server = "email server address";//"邮件服务器地址";
var msg_mail_user = "email account";//"邮件帐号";
var msg_mail_passwd = "email password";//"邮件帐号密码";
var msg_email_in = "email receiver address";//"收件人地址";
var msg_email_re = "email response address";//"回复地址"

//alarm.htm
var port_alarm_msg = "Please choose a monitored port at least.\n";

// Diagnostics.htm
var msg_ping_addr = "the destination address";//"目的地址";
var msg_ping_size = "the message size";//"报文大小";
var msg_ping_number = "the message number";//"报文数目";
var msg_ping_interval = "the message interval";//"报文间隔";
var msg_ping_timeout = "response timeout";//"应答超时";
var msg_invalid_ipaddr = "%s is invalid, please input again.\n";//"%sIP地址不合法, 请重新输入.\n";
var msg_invalid_domain = "%s is invalid, please input again.\n";//"%s域名不合法, 请重新输入.\n";

//trunk
var msg_trunking_least = "Trunk group %s needs 2 ports at least.\n";//"第%s组汇聚设置至少需要2个端口!\n";
var msg_trunking_most = "Trunk group %s can't exceed %s ports.\n";//"第%s组汇聚设置至多可以有%s个端口!\n";
var msg_trunking_port_disabled = "In trunk group %s, trunk ports have been disabled.\n";//"在第%sTRUNK端口组中，有TRUNK端口已经被禁用!\n";
var msg_trunking_port = "The same port choosed between group %s and group %s.\n";
var msg_trunking_port_ring="In trunk group \%s,trunk ports have been used for ring.\n";
var msg_trunking_port_rstp="In trunk group \%s,trunk ports have been used for rstp.\n";
var msg_trunking_port_edit="In trunk group \%s,trunk ports do not stay the same!\n";
var msg_trunking_port_erps="In trunk group \%s,trunk ports have been used for erps.\n";
var msg_trunking_port_loopback="In trunk group \%s,trunk ports have been used for loopback detection.\n";
var msg_trunking_port_inconformity="In trunk group \%s,the types of trunk ports are inconsistent!\n";//在汇聚组\%s中，有TRUNK端口的端口类型未保持完全一致，无法进行汇聚!;
var msg_trunk_mirror_exclusion = "The port mirror has been opened, please close it!\n"//"端口镜像功能已开启, 请关闭端口镜像功能!\n";
var msg_trunk_qvlan_exclusion = "VLAN function is turned on, please turn it off!\n";//"802.1Q vlan功能已开启, 请关闭802.1Q vlan功能!\n";
var msg_trunk_default_pvlan_exclusion = "Port VLAN is not default configuration, please restore to the default configuration!\n";//"端口vlan非默认配置, 请配置端口vlan为默认值!\n";
var msg_trunking_port_disable_lacp = "In trunk group %s,ports %s is already used as a lacp ports!\n;"//"汇聚组%s中端口G%s已被作为LACP端口\n";
var msg_trunking_disable_lacp = "Group id %s has already been used to lacp\n!";//"汇聚组%s已被LACP使用\n!";
//protect port
var msg_protect_port = "The protected ports need 2 ports at least.\n";//"被保护的端口至少需要设置2个端口!\n";

//SNMP
var msg_snmpdevice_name = "SNMP device name";//"SNMP设备名称";
var msg_snmp_get_comm = "SNMP read-only entry";//"SNMP只读通信字符串";
var msg_snmp_set_comm = "SNMP read-write entry";//"SNMP读写通信字符串";
var msg_invalid_snmp_trap = "SNMP trap gateway is not valid.\n";//"SNMP TRAP管理网关不是有效IP地址!\n";
var msg_snmp_view_nme = "View name";
var msg_snmp_view_oid = "OID";
var msg_snmp_comm_name = "Community name";
var msg_snmp_user_name = "User name";
var msg_snmp_user_authpasswd = "Authentication password";
var msg_snmp_trap_ip = "trap gateway IP addr";

//rstp
var rstp_hello_time = "RSTP polling interval";//"RSTP轮询时间";
var rstp_forward_delay = "RSTP forwarding delay";//"RSTP转发延迟";
var rstp_max_age = "RSTP max aging time";//"RSTP最大报文过期时间";
var rstp_delay_max_age = "In RSTP: 2 * (forwarding delay - 1.0) >= RSTP max aging time\n";//"RSTP中: 2 *（转发延迟 - 1.0) >= 最大报文过期时间";
var rstp_max_age_hello = "In RSTP: RSTP max aging time >= 2 * (polling interval + 1.0)";//"RSTP中: 最大报文过期时间 >= 2 *（轮询时间 + 1.0)";
var rstp_port_cost = "path cost";//"路径开销";
var rstp_port_war = "port %s";//"第%s端口";
var rstp_port_trunk = "In RSTP,ports %s is already used as a trunk ports!\n";//"在RSTP中，端口 %s 已经被作为TRUNK端口!\n";
var rstp_port_loopback = "port %s has set loopback detection enable!\n";//"端口%s启用了端口环回检测功能！\n";
var rstp_port_lacp = "port %s has set lacp enable!\n";//"端口%s已经被作为LACP端口！\n";
//VLAN
var msg_pvlan_name = "the name of port vlan";//"端口VLAN名称";
var msg_qvlan_index = "802.1Q VID";
var msg_qvlan_pvid = "802.1Q PVID";//"802.1Q 端口VLAN ID";
var msg_qvlan_drop_port = "All ports drop the frames without vlan tag, the device may not work normally.\n";//"您已经将所有的通讯端口选择了丢弃无tag的帧,这样可能会导致无法与交换机通讯.\n确定要执行此操作吗?";
var msg_no_member = "At least two forwarding ports must be in forwarding table.\n";//"转发表项中必须选择至少两个转发端口!\n";
var msg_pvlan_max_member = "port vlan can't exceed 32 items.\n";//"端口VLAN最多可以增加32个表项!\n";
var msg_qvlan_max_member = "802.1Q VLAN can't exceed 64 items.\n";//"802.1Q VLAN最多可以增加64个表项!\n";
var msg_valn_fwd_member = "ports %s are not in one forwarding rule.\n";//"端口%s没有被安排到某个转发规则中!\n";
var msg_valn_warning = "in port %s";//"端口%s中";
var msg_vlan_port_alluse = "All ports are in forwarding rule.\n";//"所有端口都已经被安排到转发规则中!";
var msg_qvlan_pvid = "802.1Q PVID must meet this condition: 1 <= VID <= 4094.\n";//"802.1Q 端口VLAN ID必须满足条件：1<=VID<=4094!\n";
var msg_vtrunk_vlan = "VLAN list can't be blank.\n";//"VLAN列表不能为空!\n";
var msg_vtrunk_vid_error = "Please input the right VID scope";//"请输入正确的 VLAN ID 范围!\n";
var msg_vtrunk_vlist_null = "VLAN Trunk list can't be blank.\n";//"VLAN Trunk列表为空!\n";
var msg_vtrunk_del_dou = "Can't comma in the front or in the tail of VLAN list.\n";//"VLAN 列表中 开始或者末尾不能有逗号!\n";
var msg_vtrunk_port_null = "Please choose one VLAN Trunk port at least.\n";//"请至少选择一个VLAN Trunk端口!\n";
var msg_vtrunk_mport_null = "Please choose one vlan manage port at least.\n";//"请至少选择一个VLAN 管理端口!\n";
var msg_vtrunk_port_error = "One VLAN Trunk port and manage port are the same.\n";//"VLAN Trunk端口与管理端口有重叠!\n";
var msg_vlan_choose_port = "Please choose vlan port.\n";//"请选择划分VLAN的端口！";
var msg_vtrunk_port_repeat = "Check VLAN List is repeat Please input again.\n";//"基于802.1Q的VLAN,一个端口只能对应一个VLAN";
var msg_vtrunk_manager_port_disabled = "vlan trunk manage port has been disabled.\n";//"VLAN TRUNK管理端口已经被禁用!\n";
var msg_vtrunk_port_disabled = "vlan trunk ports have been disabled.\n";//"您所选择的VLAN TRUNK端口已经被禁用!\n";
var msg_vlan_adv_enable = "If 802.1q vlan advanced is enabled, you computer may not connect the switch. \n Are you sure to do this?";
var msg_vlan_mode_pvid_error = "In ACCESS mode，Port\%s PVID invalid，must in VLAN list!\n";
var msg_enable_vlan_exclusion_trunk = "The trunk function has been turned on, please turn it off!\n";//"汇聚功能已开启，请关闭!\n";

//VLAN Hybrid
var msg_vlan_access_error="Port %s is Access mode,only one vlan can pass,range:1~4094.\n";//"端口%s是Access端口,它允许通过的VLAN有且只有一个,范围为1~4094!\n";
var msg_vlan_pvid_error="The PVID of port %s is error,PVID range:1~4094,only one of the allowed forward vlan can pass!\n";//"端口%s的PVID有误,PVID取值范围为1~4094,且只能为端口允许通过的VLAN中的一个!\n";
var msg_vlan_allow_error="The value of port %s's 'Allowed Forward Vlan Table' is error,please configure again and vlan can't exceed %s items!\n";//"端口%s的允许通过的VLAN组配置值有误,请按照格式重新配置且不能超过64条!\n";
var msg_vlan_tag_error="The form of port %s's value is configured error in 'Transmit Vlan Untagged Table',please configure again!\n";//"\n端口%s的出口不打标记的VLAN组配置值有误,请重新配置!\n";;
var msg_vlan_tag_error_hybrid="The value of port%s's  'Transmit Vlan Untagged Table' is not within the scope of the value of 'Allowed Forward Vlan Table',please configure again!\n";//var msg_vlan_tag_error_hybrid="\n端口%s的出口不打标记的VLAN组配置值不在允许通过的VLAN范围内，请重新配置！\n"
var msg_vlan_manage_vlan_range_error="manage vlan";
var msg_set_manage_vlan_error = "At least one port allow manage vlan pass!";//"至少要有一个口，允许管理Vlan通过";
var msg_erps_enable_pvlan="ERPS is running, Port-based VLAN cannot be enable!\n";//"ERPS功能已开启，无法开启基于端口的VLAN，请确认!\n";
var msg_erps_protocol_vlan="VLAN \%s is used as protocol vlan of ERPS, it cannot be created!\n";//"VLAN \%s 已作为ERPS的协议VLAN，无法创建！\n";
var msg_no_select_port="Port not seleceted!\n";

//ip acl
var msg_dst_port_err = "Target port number range is wrong,please re-enter.\n";
var msg_src_port_err = "Source port number range is wrong,please re-enter.\n";
var msg_l4portrange_overlap_err = "Source / Target port number range cannot overlap.\n";
var msg_l4portrange_resource_err = "For source/target port number range match, only four entrys are supported.\n";

//seep setting
var msg_speed_warning = "All ports are disabled, you may not config the device by web browser.\n";//"必须有一个以上的端口被启动，否则将下次无法通过Web配置交换机!\n";

//ring
var msg_ring = "Ring";
var msg_ring_id = "fast ring id";//"快速环网标识";
var msg_double_ring = "Group %s must only have two ports.\n";//"快速环网组%s的双臂环应该使用且仅使用两个端口!\n";
var msg_single_ring = "Group %s must have only two ports.\n";//"快速环网组%s的双臂环应该使用且仅使用一个端口!\n";
var msg_ring_repeat = "Fast ring group %s and %s obtain the same ports.\n";//"快速环网组%s和%s使用的端口重复,请确认!\n";
var msg_ring_id_repeat = "Group %s and %s obtain the same fast ring id.\n";//"快速环网组%s和%s的网络标识重复,请确认!\n";
var msg_ring_repeat_id_error = "Fast ring group %s and %s obtain the same ports.,Use %s for Ring Coupling id!\n";
var msg_ring_id_error = "%s < ring id < %s.\n";//"快速环网网络标识应该在%s和%s之间!\n";
var msg_ring_port_disabled = "In group %s, some ring ports have been disabled.\n";//"在第%s环网组中，有环网端口已经被禁用!\n";
var msg_ring_trunk_port_disabled = "In 4th ring group, ring port has been disabled.\n";//"在第4环网组中，耦合端口已经被禁用!\n";
var msg_ring_trunk_collision = "ports %s can't be both ring ports and trunk ports.\n";//"%s\n不能同时作为环网端口和汇聚端口!\n";
var msg_ring_port_trunk = "In ring group %s,ring ports have been used for trunk!\n";//"在快速环网组%s中，已有快速环网端口已经被作为TRUNK端口!\n";
var msg_ring_trunk_coupling = "In 4th ring group, coupling ports have been used for trunk!\n";//"在第4环网组中，耦合端口已经被作为TRUNK端口!\n"
var msg_ring_port_err = "The ports of ring group %s is duplicate, please recheck!\n";
var msg_ring_vlan_err = "data vlan config error,please configure again!\n";

//erps
var msg_erps_duplicate = "Ring ID used by group %s and %s is duplicate,please confirm!\n";
var msg_erps_id_error = "group %s and %s 's date vlan  duplicate but ERPS ID is not same ,please confirm!\n";
var msg_erps_vlan_duplicate = "Protocol VLAN used by group %s and %s is duplicate,please confirm!\n";
var msg_data_vlan_error = "manage vlan is not belong to any group's data vlan,please confirm!";
var msg_diff_erps_port_duplicate = "Port and ERPS ID used by group %s and %s is duplicate,please confirm!\n";
var msg_erps_port_duplicate = "East port and west port are duplicate in group %s,please confirm!\n";
var msg_erps_major_port = "In group %s, neither west port nor east port can be none when its Ring Type is Major Ring!\n";
var msg_erps_port = "In group %s, east port and west port can not be none at the same time!\n";
var msg_erps_vlan = "group %s's  protocol vlan  is duplicate with group %s's data vlan!\n";
var msg_erps_def_mac = "The configure of Destination MAC Of Protocol Frame must be the same in enabled groups!\n";
var msg_belong_major = "Group %s is configured as interconnection node, but its Belong Major does not exist, please confirm!\n";
var msg_erps_port_disabled = "In group %s, ring port has been disabled!\n";
var msg_erps_enable = "There is not any ring group enabled, please confirm!\n";
var msg_sub_belong_error = "In group %s, the Belong Major of sub ring is itself!\n";
var msg_erps_port_trunk = "In group %s, ring port has been used for trunk!\n";
var msg_vlan_type="VLAN Type is Port-based VLAN, please set VLAN Type to IEEE 802.1Q VLAN and retry!\n";//"开启ERPS时，VLAN类型需设置为802.1Q模式，请确认后重试!\n";
var msg_protocol_vlan="The protocol vlan of group \%s has been used, please choose a unused one!\n";//"环网组\%s的协议VLAN已创建，请重新选择未创建的VLAN作为协议VLAN!\n";
var msg_erps_disable_storm = "Ring Group %s,the port with ring network has been used as the port for storm detection.\n";//"环网组%s中，有环网端口已经被作为风暴检测端口！\n";
var msg_erps_disable_rstp = "The RSTP is running and ERPS cannot be started!\n";//"RSTP功能正在运行，无法开启ERPS！\n";
var msg_erps_disable_lacp = "Ring Group %s,the port %s with ring network has been used as the port for LACP detection.\n";//"环网组%s中，环网端口G%s已经被作为LACP端口！\n"

//NTP
var msg_time_server = "time synchronization server address";//"时间同步服务器地址";

//AUTH
var msg_auth_name = "authentication user name";//"认证用户名";
var msg_auth_pass = "authentication user password";//"认证用户密码";
var msg_auth_max_member = "IEEE 802.1X authentication can't exceed 128 users.\n";//"IEEE 802.1X 认证最多可以增加128个用户!\n";
var msg_auth_null = "authentication database can't be blank.\n";//"认证数据库内的用户不能为空!\n"
var msg_reauth = "IEEE 802.1X authentication time again";//"IEEE 802.1X 重新认证时间";
var msg_radius = "IEEE 802.1X authentication server";//"IEEE 802.1X 认证服务器";
var msg_AAA = "IEEE 802.1X billing server";//"IEEE 802.1X 计费服务器";
var msg_radius_port = "IEEE 802.1X authentication server port";//"IEEE 802.1X 认证服务器端口";
var msg_AAA_port = "IEEE 802.1X billing server port";//"IEEE 802.1X 计费服务器端口";
var msg_invalid_key = "The sharing password of authentication server must be consisted by letters , chinese or numbers,\n and can not more than 64 bytes and fewer then 6 bytes.\n";//"认证服务器的共享密码只允许为不大于64个字节且不小于6字节的英文，数字和汉字的组合!\n";

//lock
var msg_max_mul = "Static Multicast MAC list can't exceed 512 items.\n";
var msg_max_lock = "Static unicast lock MAC list can't exceed 512 items.\n";//"静态MAC地址表最多只可以增加64个表项!\n";
var msg_mul_lock = "Multicast or broadcast address can't join static unicast lock address table.\n";//"静态单播锁存地址表不可以加入多播或广播地址!\n";
var msg_uni_igmp = "Unicast or broadcast address can't join static multicast address table.\n";//"静态多播锁存地址表不可以加入单播或广播地址\n";
var msg_mac_ob = "Multicast address exceed the range.\n";//"组播地址超出范围\n";

//storm
var msg_storm_pkts = "Please choose a strict kind at least.\n";//"请至少选择一种限制类型!\n";

//mac.html
var msg_oidtime_error = "MAC old time value range from %s to %s";
var msg_oidtime_numerror = "please input correct interger!";
//speed
var msg_speed_disable_ring = "The ports you disabled are ring ports.\n";//"你所禁用的端口目前正在作为环网端口\n";
var msg_speed_disable_vlantrunk = "The ports you disabled are vlan trunk ports.\n";//"你所禁用的端口目前正在作为VLAN TRUNK端口!\n";
var msg_speed_disable_vlantrunk_manager = "The port you disabled are vlan trunk management port";//"你所禁用的端口目前正在作为VLAN TRUNK功能的管理端口!\n";
var msg_speed_disable_trunk = "The port you disabled are trunk port.\n";//"你所禁用的端口目前正在作为TRUNK端口!\n";
var msg_speed_disable_mirror = "The port you disabled are mirror port.\n";//"你所禁用的端口目前正在作为镜像端口!\n";
var msg_speed_disable_mirror_capture = "The port you disabled are capture port.\n";//"你所禁用的端口目前正在作为采集端口!\n";
var msg_speed_disable_tail = "Please close the functions of these ports which are disabled.\n";//"请先关闭这些端口正在使用的功能!\n";
var msg_speed_edit_trunk_="The port you edit are trunk port.\n";
var msg_speed_disable_lacp = "The ports %s you disabled are lacp ports.\n";//"你所禁用的端口目前正在作为LACP端口\n";


var msg_upgrade_status = "Upgrading,upgraded(%s/3)file,Do not cut power or operate the switch,need 1 to 2 minutes to upgraded complete.";
var msg_set_for_reboot = "Operate succeed, Now Rebooting...";
//copyright
var msg_copyright = "Copyright&copy;All Rights Reserved&nbsp;2012-2022&nbsp;";

//lacp
var msg_lacp_disable_trunk = "LACP can't be turned on at the same time as port aggregation, so the port aggregation function should be turned off first.!\n";//"LACP不能与端口汇聚同时开启，请先关闭端口汇聚功能！\n";
var msg_lacp_disable_trunk_group = "Group id %s has already been used!\n";//"汇聚组%s已被使用\n!";
var msg_lacp_duplicate_trunk_group = "lacp id  %s and %s Group id is duplicate!\n"; //编号%d和%d的汇聚组重复
var msg_lacp_disable_lacp_group = "The port %s trunk group ID %s is disable\n";//"端口G%s的汇聚组ID%s未启用\n";
var msg_lacp_disable_speed = "The port %s has been disabled\n";//"端口G%s被禁用\n";
var msg_lacp_disable_rstp = "The port %s is rstp port\n";//"端口G%s已经被作为RSTP端口\n";
var msg_lacp_disable_erps = "The port %s is erps port\n";//"端口G%s已经被作为ERPS端口\n";
var msg_lacp_disable_trunk_port = "The port %s is trunk port\n";//"端口G%s已经被作为TRUNK端口\n";
var msg_lacp_disable_mirror = "The port %s is capture port\n";//"端口G%s已经被作为镜像端口\n";
