//数据网日汇总
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='week' ">IPMSDM.DM_LTE_LOW_DL_RATE_CELL_W</if>   
</select>


<select id="resultMapping">
  --TIME_ID=报表日期 --CELL_NAME=小区名称 --CGI=CGI --COVERAGE=基站类型 --COVER_UNIVERSIT=覆盖场景 --AREA_NAME=属地分公司 --CITY_NAME=行政区域 --MAINTENANCEDEPT=维护部门 --DL_BYTES=下载总流量(B) --DL_GT500K_BYTES=500K下载总流量(Byte) --DL_GT500K_DURATION=下载时长(ms) --DL_GT500K_RATE=大包下载速率(Mbps) --IM_DL_BYTES=下载总流量（即时通信） --IM_DL_GT500K_BYTES=500K下载总流量(Byte)（即时通信） --IM_DL_GT500K_DURATION=下载时长(ms)(即时通信） --IM_DL_GT500K_RATE=下载速率（即时通信） --RSTP_DL_BYTES=下载总流量（视频） --RSTP_DL_GT500K_BYTES=500K下载总流量(Byte)（视频） --RSTP_DL_GT500K_DURATION=下载时长(ms)（视频） --RSTP_DL_GT500K_RATE=下载速率（视频） --APP_DL_BYTES=下载总流量（应用商店） --APP_DL_GT500K_BYTES=500K下载总流量(Byte)（应用商店） --APP_DL_GT500K_DURATION=下载时长(ms)（应用商店） --APP_DL_GT500K_RATE=下载速率（应用商店） --HTTP_DL_BYTES=下载总流量（浏览业务） --HTTP_DL_GT500K_BYTES=500K下载总流量(Byte)（浏览业务） --HTTP_DL_GT500K_DURATION=下载时长(ms)（浏览业务） --HTTP_DL_GT500K_RATE=下载速率（浏览下载） --MR_RSRP_06=参考信号接收功率06_[-111，-110) --MR_RSRP_05=参考信号接收功率05_[-112，-111) --MR_RSRP_04=参考信号接收功率04_[-113，-112) --MR_RSRP_03=参考信号接收功率03_[-114，-113) --MR_RSRP_02=参考信号接收功率02_[-115，-114) --MR_RSRP_01=参考信号接收功率01_[-120，-115) --MR_RSRP_00=参考信号接收功率00_<-120 --MR_COVERATE_RATIO_B=参考信号接收功率采样点点数 --MR_COVERATE_RATIO=MR低于-110DB比例 --CQI_RATIO_A=大于等于10的量 --CQI_RATIO_B=总采样量 --CQI_RATIO=高CQI占比 --NBRCQI0=值为0的CQI数 --NBRCQI1=值为1的CQI数 --NBRCQI2=值为2的CQI数 --NBRCQI3=值为3的CQI数 --NBRCQI4=值为4的CQI数 --NBRCQI5=值为5的CQI数 --NBRCQI6=值为6的CQI数 --NBRCQI7=值为7的CQI数 --NBRCQI8=值为8的CQI数 --NBRCQI9=值为9的CQI数 --NBRCQI10=值为10的CQI数 --NBRCQI11=值为11的CQI数 --NBRCQI12=值为12的CQI数 --NBRCQI13=值为13的CQI数 --NBRCQI14=值为14的CQI数 --NBRCQI15=值为15的CQI数 --ATTCONNREESTAB=RRC连接重建请求次数 --ATTCONNESTAB=RRC连接建立请求次数 --ATTCONNREESTAB_RATIO=连接重建占比 --NBRINITTBUL_QPSK=QPSK模式上行传输初始TB数 --NBRINITTBUL=上行传输初始TB数 --NBRINITTBUL_QPSK_RATIO=上行QPSK编码比例 --NBRINITTBDL_QPSK=QPSK模式下行传输初始TB数 --NBRINITTBDL=下行传输初始TB数 --NBRINITTBDL_QPSK_RATIO=下行QPSK编码比例 --NBRPKTLOSSUL=小区上行丢包数 --NBRPKTUL=小区上行包数 --NBRPKTLOSSUL_RATIO=小区用户面上行丢包率 --NBRPKTLOSSDL=小区下行丢包数 --NBRPKTDL=小区下行包数 --NBRPKTLOSSDL_RATIO=小区用户面下行丢包率 --PAGRECEIVED=寻呼请求记录个数 --PAGDISCARDED=寻呼丢弃记录个数 --ENODEB_CALL_CONGESTION_RATIO=eNodeB寻呼拥塞率 --ATTRELENB=eNB请求释放上下文数 --ATTRELENBNORMAL=正常的eNB请求释放上下文数 --SUCCINITALSETUP=初始上下文建立成功次数 --NBRLEFT_CONTEXT=遗留上下文个数 --WIRE_DROP_RATIO=无线掉线率 --SUCCCONNESTAB=RRC连接建立成功次数 --RRC_CONN_SUCC_RATIO=RRC连接建立成功率 --NBRATTESTAB=E-RAB建立请求数 --NBRSUCCESTAB=E-RAB建立成功数 --ERAB_ESTAB_SUCC_RATIO=E-RAB建立成功率 --WIRE_CONN_RATIO=无线接通率 --SW_SUCC_RATIO=切换成功率 --CONNRELEASECSFB=CSFB触发的RRC连接释放次数 --CONNRELEASE_REDIRECTTO2G=重定向到2G的RRC连接释放次数 --CONN_REDIRECTTOGERAN_RATIO=弱覆盖触发的重定向到GERAN占比
</select>

SELECT * 
FREOM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(to_date(time_id,'yyyyMMddhh24mi'),'yyyyiw') in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,6)
</jdbcType>
