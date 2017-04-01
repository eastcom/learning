//梦网网关BHSM统计指标(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDW.O_RE_ST_MWWG_N31_01_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_MWWG_N31_01_D</if>   
</select>


<select id="resultMapping">
  --STARTTIME=开始时间 --DATASOURCEID=资源编码 --ENDTIME=结束时间 --START_TIME=开始时间(兼容数据网管) --END_TIME=结束时间(兼容数据网管) --SEND_BHSM_VALUE=发送BHSM值 --RECV_BHSM_VALUE=接收BHSM值 --SYS_PEAK_FLUX=系统峰值 --STOP_TIME_INT=整型结束时间  
</select>

SELECT 
<if2 test=" '@timeType'=='hour' ">to_char(STARTTIME,'yyyy-MM-dd hh24') STARTTIME,to_char(ENDTIME,'yyyy-MM-dd hh24') ENDTIME,to_char(START_TIME,'yyyy-MM-dd hh24') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24') END_TIME,DATASOURCEID,</if2>
<if3 test=" '@timeType'=='day' ">to_char(START_TIME,'yyyy-MM-dd') START_TIME,to_char(END_TIME,'yyyy-MM-dd') END_TIME,</if3> 
NETYPE,
NODEID,
VER,
SEND_BHSM_VALUE,
RECV_BHSM_VALUE,
SYS_PEAK_FLUX,
STOP_TIME_INT
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>

//SP流量指标组(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_JRWG_N31_03_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_JRWG_N31_03_D</if>   
</select>


<select id="resultMapping">
 --START_TIME=开始时间 --END_TIME=结束时间 --NETYPE=类型 --VER=版本 --SP_NAME=sp企业名称 --SP_CODE=sp企业代码 --SP_SERV_CODE=sp服务代码 --SP_ACCESS_ADDR=sp接入地 --CDGW_SEND_SP_MO_NUM=接入网关向sp转发mo总数 --CDGW_SEND_SP_MO_SUC_NUM=接入网关向sp转发mo成功总数 --CDGW_SEND_SP_MO_FAIL_NUM=接入网关向sp转发mo失败总数 --CDGW_SEND_SP_MO_SUC_UTIL=接入网关向sp转发mo成功率 --SP_SEND_CDGW_MT_NUM=sp向接入网关发送mt总数 --CDGW_RET_SP_RESP_SUC_NUM=接入网关向sp返回成功应答总数 --CDGW_RET_SP_RESP_FAIL_NUM=接入网关向sp返回失败应答总数 --SP_COMM_MT_SUC_UTIL=sp提交mt成功率(%) --CDGW_TRANS_SP_STATE_NUM=接入网关向sp转发状态报告总数 --ISMG_TRANS_SP_SUCC_STATE_NUM=接入网关向sp转发成功状态报告总数 --ISMG_TRANS_SP_FAIL_STATE_NUM=接入网关向sp转发失败状态报告总数 --MT_STATE_RTN_RATIO=mt状态报告返回率(%) --MT_SUCC_RATIO=mt最终成功率(%) 
</select>

SELECT 
<if2 test=" '@timeType'=='hour' ">to_char(START_TIME,'yyyy-MM-dd hh24') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24') END_TIME,</if2>
<if3 test=" '@timeType'=='day' ">to_char(START_TIME,'yyyy-MM-dd') START_TIME,to_char(END_TIME,'yyyy-MM-dd') END_TIME,</if3> 
NETYPE,
NODEID,
VER,
SP_NAME,
SP_CODE,
SP_SERV_CODE,
SP_ACCESS_ADDR,
CDGW_SEND_SP_MO_NUM,
CDGW_SEND_SP_MO_SUC_NUM,
CDGW_SEND_SP_MO_FAIL_NUM,
CDGW_SEND_SP_MO_SUC_UTIL,
SP_SEND_CDGW_MT_NUM,
CDGW_RET_SP_RESP_SUC_NUM,
CDGW_RET_SP_RESP_FAIL_NUM,
SP_COMM_MT_SUC_UTIL,
CDGW_TRANS_SP_STATE_NUM,
ISMG_TRANS_SP_SUCC_STATE_NUM,
ISMG_TRANS_SP_FAIL_STATE_NUM,
MT_STATE_RTN_RATIO,
MT_SUCC_RATIO

FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>

//网关收发消息性能指标组(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">IPMSDW.O_RE_ST_HYWG_N31_12_5M</if>
     <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HYWG_N31_12_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HYWG_N31_12_D</if>   
</select>


<select id="resultMapping">
  --STARTTIME=开始时间 --DATASOURCEID=资源编码 --ENDTIME=结束时间 --START_TIME=开始时间(兼容数据网管) --END_TIME=结束时间(兼容数据网管) --SEND_SUBMIT_MESSAGE=发送Submit消息数(条)【网关到短信中心】 --SEND_DELIVER_MESSAGE=发送Deliver消息数（条）【网关到EC】 --SEND_STATUS_REPORT_MESSAGE=发送状态报告消息数（条）【网关给EC的Report】 --SEND_MESS_NUM=发送消息总数（条） --SEND_MAX_FLOW=发送峰值流量(秒/条) --RECE_SUBMIT_MESSAGE=接收Submit消息数（条）【EC到网关】 --RECE_DELIVER_MESSAGE=接收Deliver消息数（条）【短信中心到网关】 --RECE_STATUS_REPORT_MESSAGE=接收状态报告消息数（条）【短信中心和异省网关到本地网关】 --RECE_MESS_NUM=接收消息总数（条） --RECE_MAX_FLOW=接收峰值流量(秒/条)
</select>

SELECT 
<if2 test=" '@timeType'=='min' ">to_char(STARTTIME,'yyyy-MM-dd hh24:mi') STARTTIME,to_char(ENDTIME,'yyyy-MM-dd hh24:mi') ENDTIME,to_char(START_TIME,'yyyy-MM-dd hh24:mi') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24:mi') END_TIME,DATASOURCEID,</if2>
<if3 test=" '@timeType'=='hour' ">to_char(START_TIME,'yyyy-MM-dd hh24') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24') END_TIME,</if3> 
<if3 test=" '@timeType'=='day' ">to_char(START_TIME,'yyyy-MM-dd') START_TIME,to_char(END_TIME,'yyyy-MM-dd') END_TIME,</if3> 
NETYPE,
NODEID,
VER,
SEND_SUBMIT_MESSAGE,
SEND_DELIVER_MESSAGE,
SEND_STATUS_REPORT_MESSAGE,
SEND_MESS_NUM,
SEND_MAX_FLOW,
RECE_SUBMIT_MESSAGE,
RECE_DELIVER_MESSAGE,
RECE_STATUS_REPORT_MESSAGE,
RECE_MESS_NUM,
RECE_MAX_FLOW
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>

//互通网关统计指标组(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">IPMSDW.O_RE_ST_HLHTWG_02_5M</if>
     <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HLHTWG_02_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HLHTWG_02_D</if>   
</select>


<select id="resultMapping">
  --STARTTIME=开始时间 --DATASOURCEID=资源编码 --ENDTIME=结束时间 --START_TIME=开始时间(兼容数据网管) --END_TIME=结束时间(兼容数据网管) --TELE_ID=运营商 --TO_SM_SUBMIT_NUM=送往运营商的短信尝试提交总条数 --TO_SM_SUBMIT_SUC_NUM=送往运营商的短信成功提交总条数 --TO_SM_SUBMIT_SUC_UTIL=送往运营商的短信提交成功率 --RETN_STATE_NUM=运营商返回状态报告总数 --RETN_STATE_SUC_NUM=运营商返回成功状态报告总数 --RETN_STATE_SUC_UTIL=送往运营商短信发送成功率 --SM_SUBMIT_NUM=运营商送来短信尝试提交总条数 --SM_SUBMIT_SUC_NUM=运营商送来短信成功提交总条数 --SM_SUBMIT_SUC_UTIL=运营商送来短信提交成功率 --TO_RETN_STATE_NUM=移动返回运营商状态报告总数 --TO_RETN_STATE_SUC_NUM=移动返回运营商成功状态报告总数 --SM_SEND_SUC_UTIL=运营商送来短信发送成功率
</select>

SELECT 
<if2 test=" '@timeType'=='min' ">to_char(STARTTIME,'yyyy-MM-dd hh24:mi') STARTTIME,to_char(ENDTIME,'yyyy-MM-dd hh24:mi') ENDTIME,to_char(START_TIME,'yyyy-MM-dd hh24:mi') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24:mi') END_TIME,DATASOURCEID,</if2>
<if3 test=" '@timeType'=='hour' ">to_char(START_TIME,'yyyy-MM-dd hh24') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24') END_TIME,</if3> 
<if3 test=" '@timeType'=='day' ">to_char(START_TIME,'yyyy-MM-dd') START_TIME,to_char(END_TIME,'yyyy-MM-dd') END_TIME,</if3> 
NETYPE,
NODEID,
VER
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>