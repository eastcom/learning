//装机
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DW_FT_SE_AR_HBB_IE_ORDER_5M</if>
     <if test=" '@timeType'=='hour' ">ipmsdm.DW_FT_SE_AR_HBB_IE_ORDER_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_SE_AR_HBB_IE_ORDER_D</if>   
</select>


<select id="resultMapping">
--STARTTIME=时间 --PROVINCE=省份 --CITY=地市 --ORDER_ID=工单ID --ORDER_TITLE=工单标题 --INDEP_PROD_ID=业务类型 --PM_SERVICES=工单类型 --EXT_STATE=工单状态 --CUST_TYPE=客户类型 --REGIONAL_ATTRIBUTE=地域属性 --NEW_ACCESS_TYPE=接入方式 --USER_SCENARIOS=用户场景 --IS_TIETONG=资产归属 --APPOINTMENT_DURATION=预约时长 --LOADING_MACHINE_DURATION=装机时长 --LOADING_MACHINE_ORDER_DURATION=装机工单时长 --IS_AUTO_ACTIVATION_SUCCESS=是否自动激活成功 --CREATE_DATE=工单派发时间 --BESP_TYPE=预约方式 --BESP_DATE=预约时间 --BESP_CONSTRUCT_DATE=预约上门时间 --EESP_DATE=改约最终上门时间 --ACTUAL_DTD_DATE=实际上门时间 --FINISH_DATE=装机完成时间 --GRID_INSPECT_COMPLETE_DATE=网络线条质检完成时间 --VISITDATE=客服用户回访完成时间 --ORDER_STATE=是否退单 --RETURN_CODE=退单原因 --ADDRESS=安装地址 --DISTILL_STAFF_ID=一线装维人员姓名 --PARTY_ID=装维公司 --GRID_INSPECT_STAFF_NAME=网络线条质检人员姓名 --INSPECT_RESULT=质检结果 --IS_PRINT_QR=现场照片是否已上传 --MAC=ONU设备MAC --SN=ONU设备SN --ONU_PAYMENT_METHOD=ONU发放方式 --ONU_HAS_DEPOSIT=ONU是否有押金 --FACTORY=ONU生产厂商 --STB_MAC=机顶盒设备MAC --STB_SN=机顶盒设备SN --STB_DISTRIBUTION_MODE=机顶盒发放方式 --STB_HAS_DEPOSIT=机顶盒是否有押金 --STB_MANUFACTURER=机顶盒生产厂商 --COMMENTS=备注 --INTEGRITY=数据是否完整
</select>

select * 
from <included id="tableChooseSE"/> where 1=1 
<if test=" '@isContinue'=='f' ">
	and STARTTIME in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
	'@value'.substr(0,8)
</jdbcType>

//移机
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DW_FT_SE_AR_HBB_ME_ORDER_5M</if>
     <if test=" '@timeType'=='hour' ">ipmsdm.DW_FT_SE_AR_HBB_ME_ORDER_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_SE_AR_HBB_ME_ORDER_D</if>   
</select>


<select id="resultMapping">
--STARTTIME=时间 --PROVINCE=省份 --CITY=地市 --ORDER_ID=工单ID --ORDER_TITLE=工单标题 --INDEP_PROD_ID=业务类型 --PM_SERVICES=工单类型 --EXT_STATE=工单状态 --CUST_TYPE=客户类型 --REGIONAL_ATTRIBUTE=地域属性 --NEW_ACCESS_TYPE=接入方式 --USER_SCENARIOS=用户场景 --IS_TIETONG=资产归属 --APPOINTMENT_DURATION=预约时长 --LOADING_MACHINE_DURATION=装机时长 --LOADING_MACHINE_ORDER_DURATION=装机工单时长 --IS_AUTO_ACTIVATION_SUCCESS=是否自动激活成功 --CREATE_DATE=工单派发时间 --BESP_TYPE=预约方式 --BESP_DATE=预约时间 --BESP_CONSTRUCT_DATE=预约上门时间 --EESP_DATE=改约最终上门时间 --ACTUAL_DTD_DATE=实际上门时间 --FINISH_DATE=装机完成时间 --GRID_INSPECT_COMPLETE_DATE=网络线条质检完成时间 --VISITDATE=客服用户回访完成时间 --ORDER_STATE=是否退单 --RETURN_CODE=退单原因 --ADDRESS=安装地址 --DISTILL_STAFF_ID=一线装维人员姓名 --PARTY_ID=装维公司 --GRID_INSPECT_STAFF_NAME=网络线条质检人员姓名 --INSPECT_RESULT=质检结果 --IS_PRINT_QR=现场照片是否已上传 --MAC=ONU设备MAC --SN=ONU设备SN --ONU_PAYMENT_METHOD=ONU发放方式 --ONU_HAS_DEPOSIT=ONU是否有押金 --FACTORY=ONU生产厂商 --STB_MAC=机顶盒设备MAC --STB_SN=机顶盒设备SN --STB_DISTRIBUTION_MODE=机顶盒发放方式 --STB_HAS_DEPOSIT=机顶盒是否有押金 --STB_MANUFACTURER=机顶盒生产厂商 --COMMENTS=备注 --INTEGRITY=数据是否完整
</select>

select * 
from <included id="tableChooseSE"/> where 1=1 
<if test=" '@isContinue'=='f' ">
	and STARTTIME in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
	'@value'.substr(0,8)
</jdbcType>



//投诉
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DW_FT_SE_AR_HBB_ME_ORDER_5M</if>
     <if test=" '@timeType'=='hour' ">ipmsdm.DW_FT_SE_AR_HBB_ME_ORDER_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_SE_AR_HBB_COMP_ORDER_D</if>   
</select>


<select id="resultMapping">
--STARTTIME=时间 --FAULT_PROVINCE=省份 --FAULT_CITY=地市 --PRE_ORDER_IDS=投诉流水号 --KF_ORDER_ID=EOMS工单号 --USER_LEVEL=客户类型 --ERMG_LEVEL=工单紧急程度 --COMPLAINT_CLASSIFY_CODE_4=投诉分类-四级业务编码 --COMPLAINT_CLASSIFY_CODE_5=投诉分类-五级业务编码 --COMPLAINT_CLASSIFY_CODE_6=投诉分类-六级业务编码 --COMPLAINT_REASON_CLASSIFY_1 ==投诉报结原因分类一级分类 --COMPLAINT_REASON_CLASSIFY_2=投诉报结原因分类二级分类 --COMPLAINT_REASON_CLASSIFY_3=投诉报结原因分类三级分类 --ACCESS_TYPE=接入方式 --FIRST_RESPONSE_DURATION=首次响应时长 --COMPLAINT_HANDLE_DURATION=投诉处理时长 --ACCEPT_DATE=投诉受理时间 --FIRST_DEAL_TIME=前台预处理完成时间 --PRE_DEAL_INFO=预处理情况 --COMPLAINT_CREATE_DATE=投诉工单派发时间 --FIRST_RESPONSE_DATE=首次响应时间 --OPER_TYPE=是否改派/转派 --TRACK_CONTENT=改派/转派原因 --TRACK_DATE=改派/转派时间 --ORDER_ID=工单ID --ORDER_TITLE=工单标题 --INDEP_PROD_ID=业务类型 --PM_SERVICES=工单类型 --EXT_STATE=工单状态 --CUST_TYPE=客户类型 --REGIONAL_ATTRIBUTE=地域属性 --NEW_ACCESS_TYPE=接入方式 --USER_SCENARIOS=用户场景 --IS_TIETONG=资产归属 --APPOINTMENT_DURATION=预约时长 --LOADING_MACHINE_DURATION=装机时长 --LOADING_MACHINE_ORDER_DURATION=装机工单时长 --IS_AUTO_ACTIVATION_SUCCESS=是否自动激活成功 --CREATE_DATE=工单派发时间 --BESP_TYPE=预约方式 --BESP_DATE=预约时间 --BESP_CONSTRUCT_DATE=预约上门时间 --EESP_DATE=改约最终上门时间 --ACTUAL_DTD_DATE=实际上门时间 --FINISH_DATE=最终处理人
工单确认时间 --DISPATCH_TYPE=是否需要上门 --GRID_FINISH_DATE=网络线条报结时间 --WORK_RESULT=报结审核结果 --USER_ADDR=用户地址 --STAFF_NAME=一线装维人员姓名 --GRID_AUDIT_STAFF_NAME=网络线条报结审核人员姓名 --GRID_INSPECT_COMPLETE_DATE=网络线条质检完成时间 --VISITDATE=客服用户回访完成时间 --ORDER_STATE=是否退单 --RETURN_CODE=退单原因 --ADDRESS=安装地址 --DISTILL_STAFF_ID=一线装维人员姓名 --PARTY_ID=装维公司 --GRID_INSPECT_STAFF_NAME=网络线条质检人员姓名 --INSPECT_RESULT=质检结果 --IS_PRINT_QR=现场照片是否已上传 --MAC=ONU设备MAC --SN=ONU设备SN --ONU_PAYMENT_METHOD=ONU发放方式 --ONU_HAS_DEPOSIT=ONU是否有押金 --FACTORY=ONU生产厂商 --STB_MAC=机顶盒设备MAC --STB_SN=机顶盒设备SN --STB_DISTRIBUTION_MODE=机顶盒发放方式 --STB_HAS_DEPOSIT=机顶盒是否有押金 --STB_MANUFACTURER=机顶盒生产厂商 --REMARKS=备注 --INTEGRITY=数据是否完整
</select>

select * 
from <included id="tableChooseSE"/> where 1=1 
<if test=" '@isContinue'=='f' ">
	and to_char(to_date(starttime,'yyyy-mm-dd hh24:mi:ss'),'yyyyMMdd') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
	'@value'.substr(0,8)
</jdbcType>

//EPC防火墙
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_EPC_FIREWALL_15M</if>
     <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_EPC_FIREWALL_H</if> 
</select>

<select id="resultMapping">
	--STAT_TIME=时间 --NODE_DESC=防火墙名称 --FPC_SLOT=FPC槽位 --SPU_INDEX=SPU位置 --CPU_UTIL=CPU利用率(%) --MEMORYUSAGE=内存利用率(%)
</select>
select 
<if2 test=" '@timeType'=='min' "> to_char(STAT_TIME,'yyyy-MM-dd HH24:mi:ss') as STAT_TIME,</if2>
<if1 test=" '@timeType'=='hour' "> to_char(STAT_TIME,'yyyy-mm-dd hh24') as STAT_TIME,</if1>

	NODE_DESC NODE_DESC,
	round(FPC_SLOT,2) FPC_SLOT,
	SPU_INDEX SPU_INDEX,
	round(CPU_UTIL,2) CPU_UTIL,
	round(MEMORYUSAGE,2) MEMORYUSAGE
from <included id="tableChooseSE"/> where 1=1 
<if test=" '@isContinue'=='f' ">
	and to_char(STAT_TIME,'yyyyMMddHH24mi') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
	'@value'.substr(0,12)
</jdbcType>

//非客服系统月粒度指标
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_SE_PR_HBB_NKF_5M</if>
     <if test=" '@timeType'=='month' ">IPMSDW.DW_FT_SE_PR_HBB_NKF_M</if> 
</select>

<select id="resultMapping">
	PROVINCE_ID=省 --STARTTIMEMONTH=开始时间 --HBMOBILEBILLUSERNBR=家宽用户数 --HBTHIRDPARTYUSERNBR=三方合作家宽用户数 --HBCHAINNETINCREBILLUSERNBR=家宽环比净增用户数 --HBACTIVEUSERNBR=家宽活跃用户数 --HBPEAKONLINEUSERNBR=家宽峰值在线用户数 --HBCOVERUSERNBR=家宽覆盖用户数 --HBCOVERMOUNTRATE=家宽覆盖实装率(%) --HBCOVERPORTNBR=家宽覆盖端口数 --HBUSEDPORTNBR=家宽占用端口数 --HBCOVERPORTMOUNTRATE=家宽端口实装率(%) --CITYCOVERUSERNBR=城市覆盖用户数 --TOWNCOVERUSERNBR=乡镇覆盖用户数 --FARMCOVERUSERNBR=农村覆盖用户数 --COVERUSERNBR_FTTH=FTTH接入方式覆盖用户数 --COVERUSERNBR_FTTB=FTTB接入方式覆盖用户数 --COVERUSERNBR_OTHER=其他接入方式覆盖用户数 --FAMILYCOVERUSERNBR=家庭场景覆盖用户数 --CAMPUSCOVERUSERNBR=校园场景覆盖用户数 --CLUSTERCOVERUSERNBR=聚类场景覆盖用户数 --SELFBUILDCOVERUSERNBR=自建覆盖用户数 --TIETONGCOVERUSERNBR=铁通覆盖用户数 --THIRDPARTYCOVERUSERNBR=三方合作覆盖用户数 --HBUNDER20MUSERNBR=签约宽带20M以下用户数 --HB20M49MUSERNBR=签约宽带20-49M用户数 --HB50M99MUSERNBR=签约宽带50-99M用户数 --HBOVER100MUSERNBR=签约宽带100M以上用户数 --HBUNDER20MUSERRATIO=签约宽带20M以下用户数占比(%) --HB20M49MUSERRATIO=签约宽带20-49M用户数占比(%) --HB50M99MUSERRATIO=签约宽带50-99M用户数占比(%) --HBOVER100MUSERRATIO=签约宽带100M以上用户数占比(%) --IPTVUSERNBR=互联网电视用户数 --IPTVCHAINNETINCREUSERNBR=互联网电视环比净增用户数 --IPTVPEAKUSERNBR=互联网电视峰值在线用户数 --OLTNBR=在网OLT数量 --ONUNBR_FTTB=在网FTTB_ONU数量 --ONUNBR_FTTH=在网FTTH_ONU数量 --HGU_FTTHNBR=在网FTTH_ONU中HGU数量 --HGURATIO=在网HGU占比(%) --STBNBR=在网机顶盒数量 --ONUNBR_NEW=当月新上线的ONU数量 --ONUAUTOACTNBR_NEW=当月自动激活的ONU数量 --FTTH_ONUAUTOACTSUCRATE=FTTH_ONU自动激活成功率(%) --AGENTORDERINTIMERATE=代推预约及时率(%) --INTEGRITY=数据完整性
</select>
select *
from <included id="tableChooseSE"/> where 1=1 
<if test=" '@isContinue'=='f' ">
	and to_char(STAT_TIME,'yyyyMMddHH24mi') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
	'@value'.substr(0,12)
</jdbcType>
