//
//  DEFINE.h
//  FirstProject
//
//  Created by mac on 14-8-7.
//  Copyright (c) 2014年 personal. All rights reserved.
//

#ifndef FirstProject_DEFINE_h
#define FirstProject_DEFINE_h

//#define IP @"192.168.1.100:702"
//#define IP @"api.swhr.com.cn"
#define IP @"bjyhsy.xicp.net:42542"

//登录
#define LoginHead [NSString stringWithFormat:@"http://%@/OA/Login.aspx",IP]

//注销
#define LogOutHead [NSString stringWithFormat:@"http://%@/OA/Logout.aspx",IP]

//技服日报
#define TechniqueHead [NSString stringWithFormat:@"http://%@/OA/OAWorkReportTechnician.aspx",IP]


//申报费用列表
#define AllApplicationHead [NSString stringWithFormat:@"http://%@/OA/Cost.aspx",IP]

//费用明细
#define CostFundHead [NSString stringWithFormat:@"http://%@/OA/CostFunds.aspx",IP]

//申报模板
#define AuditTempletHead [NSString stringWithFormat:@"http://%@/OA/AuditTemplet.aspx",IP]

//申报模板详细信息
#define AuditTempletInfoHead [NSString stringWithFormat:@"http://%@/OA/AuditTempleteDetail.aspx",IP]

//审核人和费用所属人列表
#define AuditorAndOwnerUserHead [NSString stringWithFormat:@"http://%@/OA/UserAccount.aspx",IP]

//发票申请列表
#define InvoiceApplyHead [NSString stringWithFormat:@"http://%@/OA/InvoiceApproved.aspx",IP]

//发票明细
#define InvoiceSourceHead [NSString stringWithFormat:@"http://%@/OA/InvoiceInventory.aspx",IP]

//借款申请列表
#define BorrowBillHead [NSString stringWithFormat:@"http://%@/OA/BorrowBill.aspx",IP]

//用款申请列表
#define BorrowCashHead [NSString stringWithFormat:@"http://%@/OA/BorrowCash.aspx",IP]

//考勤列表
#define MyAttenceHead [NSString stringWithFormat:@"http://%@/HR/AttenceSign.aspx",IP]

//加班信息列表
#define SourceWorkListHead [NSString stringWithFormat:@"http://%@/HR/HR_AttencelWorkOvertime.aspx",IP]

//出差信息列表
#define SourceBussinessListHead [NSString stringWithFormat:@"http://%@/HR/HR_AttenceBussinessTravel.aspx",IP]

//外出信息列表
#define SourceOutListHead [NSString stringWithFormat:@"http://%@/HR/HR_AttenceOutSurname.aspx",IP]

//客户等级
#define CustomerGradeHead [NSString stringWithFormat:@"http://%@/OA/CustomerGrade.aspx",IP]

//工作日报
#define WorkJournalHead [NSString stringWithFormat:@"http://%@/OA/OAWorkReport.aspx",IP]

//工作周报
#define WeekReportHead [NSString stringWithFormat:@"http://%@/OA/OAWorkReportWeekInfo.aspx",IP]

//请假信息列表
#define SourceLeaveListHead [NSString stringWithFormat:@"http://%@/HR/HR_AttenceLeave.aspx",IP]

//工程工作管理
#define EngineeringJournalHead [NSString stringWithFormat:@"http://%@/OA/OAWorkReportProject.aspx",IP]

//销售汇报
#define SaleReportHead [NSString stringWithFormat:@"http://%@/OA/OAWorkReportSaleInfo.aspx",IP]

//审核明细
#define AuditorListHead [NSString stringWithFormat:@"http://%@/OA/Audit.aspx",IP]

//供应商
#define SupplierHead [NSString stringWithFormat:@"http://%@/OA/Suppliers.aspx",IP]

//地址
#define AddressHead [NSString stringWithFormat:@"http://%@/OA/CommonInterface.aspx",IP]

//公司企业
#define CompanyHead [NSString stringWithFormat:@"http://%@/OA/Orginzation.aspx",IP]

//代理商信息
#define AgentHead [NSString stringWithFormat:@"http://%@/OA/Agent.aspx",IP]

//代理商拜访
#define AgentVisitHead [NSString stringWithFormat:@"http://%@/OA/OAAgentVisit.aspx",IP]

//预约用车
#define UseCarHead [NSString stringWithFormat:@"http://%@/OA/OAAutomotiveUseRecord.aspx",IP]

//预约会议室
#define MeetingRoomHead [NSString stringWithFormat:@"http://%@/OA/OAMeetingRoom.aspx",IP]

//物料审核
#define MaterialAuditHead [NSString stringWithFormat:@"http://%@/OA/OAMaterials.aspx",IP]

//外购入库
#define GodownEntryHead [NSString stringWithFormat:@"http://%@/ERP/Purchase.aspx",IP]

//发货管理
#define ShippingHead [NSString stringWithFormat:@"http://%@/OA/OAProjectDelivery.aspx",IP]

//任务管理
#define TaskHead [NSString stringWithFormat:@"http://%@/OA/OAAssignment.aspx",IP]

//部门或单位列表
#define GetOrganizationListHead [NSString stringWithFormat:@"http://%@/OA/Orginzation.aspx",IP]

//资金管理
#define FundManagementHead [NSString stringWithFormat:@"http://%@/OA/OABankAccountFunds.aspx",IP]

//文档查看
#define DocumentConsultHead [NSString stringWithFormat:@"http://%@/OA/CommonInterface.aspx",IP]

#endif
