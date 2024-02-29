Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1E31361A1
	for <asahi@lists.linux.dev>; Thu, 29 Feb 2024 13:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709214742; cv=fail; b=S3y6F8NHUs1/CYYYOyKsV4HG7eVtSniqesKVtmp/i1iDDCqSht7Ml4NLal9MZIgeIcFl1NV68kPtsXoVCR9HLQG6iBgFrd8LuOLK7pPO3Y2SN6LMyScHvZ8TkwKvVd9unEGiNIg1qHtmBZ29BPTBtOMQ8k0gY4a3VcboMOsoqfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709214742; c=relaxed/simple;
	bh=cD/WKIWssHewpkSzfk0oK1PRqA0GVOxPxzmffelmMjE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uL1kZKXA4WeWIiMzX2GeD3poV9FIORLC8VOnqmFvC5rsP2MtJfapCYUs8ZCrMQvEITAL7Hvl5WyGXnsFPtXw8DkL4EJnSdEI37OCCSWV+CAjQmfG8ztxH8KOgRbBLvGZh5kcNKDoXsSYivoPC7W54Nb0iG8VIqnz5tf5hPLzba0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zw+mVkiy; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zw+mVkiy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjQgAIel6ri2zbmIM46287RUOvVx/ysstW8dGgh0ATxwe48NmWsaOIiCdjgNzh1UySr/rSy2SH2M0DXxX3xijt1+aQQZknRRcwyqDSzoyENoFzrApWqaUZwpoJTZmm9f41DMxSsQ26DL+EoEfHakxXoABv822O6RZ/jQfZgqISlbAPacGnEHpUPoUfoBTVN0hrm5ea9dZmZMDrItxtImO6ZrN5PBcu8v3bLerOABAfMSxnUx4lspafOVaoxizAS5ymYpveSNl4Rfm1ZmPP9DyQjqmhudLmcImMKFSEjPx9AYgnZGZonou+dsxT58ZYBNRTPP6/r0pJDk4L4lMQyjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRic2cWbJFcBb/+adDObVzEWsd9zD7fAsA171LUYbD0=;
 b=Aaqj1myWrC64Zzqi5Vp2GZOiwmf0E1xfTcU7T/nvh8Bu1Zbqne4o6P7xWAkcQjqsxQ0UaFrVXED175H++Tn10ROHJlJRchMIaqkMfrKRJUAuHiwM4cDRIVHqIkXvOpZ+zCMrzw03KJomSs0qwfkRau4yMvKApfZ0uG3LglWU1tOBFxCEnbJiyGhwk+vl6EVjoDzk7gRW7FrFMy/BdBEDe6Onfsi3w5cdoQtgDe+ra6ephyCvtXy2Dhwy/cc7buTWNIcNPPOO8aww9Sd4DExyKQ8oMRAnIG6zaH8eK/zAaOekgQgaw8XWSM6ryu6vXMEqfB1upbWjsQC/s28FrGnDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRic2cWbJFcBb/+adDObVzEWsd9zD7fAsA171LUYbD0=;
 b=Zw+mVkiywL9a6Esinsd8/Fo6GDCAry5oWua4MB8Gpm61jkamVIZFXCSQhHB76tLcfdSf9TwhJAGjS/Qn052Oap7FoP2nXxIG1CjjNaeiO6mJhoNKQz5GqXZlioEamEKsuPmWsic4jHDPc8vVl7EFl42UquR8xYmAHcyqfObl3HvP9gD3p2LDuBfe9G7hHvFhzAQCm1qfZFGZMniokoIPpziDUFoUDIz5+tPjtRBZ92ppRnI703Z6wk0bstZBXGCOHktuQNmSk2iuD0lrM3kPVbBSRjVHlJVtXs7tBxqsbBMJQnqUHvHsgmiqIuzLV67CivaWRhMxSrI/vL6aRjfpIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by CH3PR12MB8755.namprd12.prod.outlook.com (2603:10b6:610:17e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Thu, 29 Feb
 2024 13:52:15 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1%3]) with mapi id 15.20.7316.039; Thu, 29 Feb 2024
 13:52:15 +0000
Message-ID: <a142cd4d-bedf-4666-8dc7-fcfbfc4ebb78@nvidia.com>
Date: Thu, 29 Feb 2024 15:52:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/21] nvme: split out a nvme_identify_ns_nvm helper
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20240228181215.873854-1-hch@lst.de>
 <20240228181215.873854-14-hch@lst.de>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20240228181215.873854-14-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0430.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::21) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|CH3PR12MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 0adcd5c2-58e6-4132-c514-08dc392da302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0uWIBfOv/cV8SD7efhiHAfFaRI32Rh1jQC8x6lrVlO5apBMivnqRNK/7TVLvL8Le8S4it7R/2mFvw23PFEKX5iZFRbBSvk8P0AuNTaeYGQIQYfFYg19CNGKLta+hquMtmZq/icauOHxb7+EJeRKj7j7+/HaIvZVZB6nsO4BbxC/fmguSGrVaes92l5WcskQ9IAXTolzeq5gmHNnnYQXgDmUgj2Ch2+imWwGkNvebUyrAMZiOa5QMJ+4ZniAcFaWEBLkEiHdmtZnY5BlJS4NlMurBduLSKKXZBLgeX9L+cyRxZr9W0vqgExYk49tN7dBz2WxGlN1RPdcFVCheYYCo7JWmMGqcku2ahZ0C7a47EIrxDF5CVBHJ96Cjw5PRriDyizuFWphNbsUQPEoiiUm5yEJ0odfSd5tcqV0hN4/UA0RU5QvEZ0LQWyo+3lU7YZrKq24+yPbo6Q4UNWr6f+C8CcTSJT4oB+1NMBiYaEh/3PrpIbJNzaPTBw17L1me/rsW+YtQNB+7NrpICSWgJSZyuRTO/Evdym1xl3zzVb2wL8SyYzRy/P+bUDSyuUmAkr7hPKt/WRG3KQP7pPWOCiLRygpeKNLyevt0sh1AeaCjASk44uPxiHlm4WTJFmm4fcpL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVhvQ1l6MXppVjFRaEQ4WHpCcXMxS0pRbERzQW5SbDl5WmNXRjBFY2pMdlZW?=
 =?utf-8?B?NWNQSys3NExhWWJwR050WnhZZTl0QnRta3lUOEJiL3g1NzczVmhLNWh6OXNP?=
 =?utf-8?B?eVBvWHEreGhCeTVsMExnOXRJbkVMcnNBY0RVeSsrd0xIMnRUcjV1SXU1L1hY?=
 =?utf-8?B?YVd2U2hEV2R2UDFTbndBMVVSQnVyYWh5ZVVKVnhnelVoQzB0WUorZ2diaXM2?=
 =?utf-8?B?YkxXNTZGVXJQcmx1SDlCcXd3OUZrb1EyenpwU01aVlJMTUVrT0pkQWIwNzRB?=
 =?utf-8?B?aUxPSno1N3hwWGVLamgzZHlFb0p1N1UralFrbHY1V1p5UmdNQW5CZmFhUEdT?=
 =?utf-8?B?K0t0N3Q0Ym13djNGdW1KYnNhc2RpZCttUk8rQ0dDKzBHbUtUdWFtaDR5VHZt?=
 =?utf-8?B?WWVTSmo0UnA4OUNxU0FQMXQ3Ny9YcC9vWktodEtaTlVDZ3BsVHhJb3U4dFlK?=
 =?utf-8?B?L3RlZDRSL1BhQkNCazFBU25nWjJLaDJnK29qOEdMZncyVE0weTBEenh0UVNU?=
 =?utf-8?B?L3dhaXZ2Z2k5d2JJTDdzU0N0VjdZOE8wZGIvVmd5djMxMTJHckpyQzlmbEZp?=
 =?utf-8?B?N091aStvT3VTWHZMMTZsRTNHNU1GTEZGMDJtN3RqZFVXS2I5NDNjdERIOFB3?=
 =?utf-8?B?elNXUDg2TGdOK3hLc3I5VGZBSXZzMVRRRlNiRmhuc3pFdWlOWVF6VHBjNGVn?=
 =?utf-8?B?UjZvUG9CTWdOVGlsZlpIVGJRRmEvMVRxYWtINjJPQjJheWZOSmVobEttcytm?=
 =?utf-8?B?Mmc5NldiSGdwRlE2WHRabzZNYVQ0RlRpMC9uZDcrZzRmZjNNY0FQc1ZBS2Z4?=
 =?utf-8?B?aFRyOHd1UTgvNE56NTRSYXN0ZUxGTTZaNzBueTBoR2ttSTVZMnJmTlZRanZi?=
 =?utf-8?B?RU0xcncwYi9vRjY3V0MvaDI0NWhXeS9yWC9QL0N1TzgvYy9YNGdSU2JkVDg5?=
 =?utf-8?B?T1hoOC8xOExjc2R6L0t3ZjBJaW5zdmFXcHBsdEU2VnlsbFBJd0krRUFqV2Fr?=
 =?utf-8?B?amxJZEtUM2dlVS9JdGdCYnhQSk5vcDMzVDJYNXBPUHJ5S2U1aCt4YnR3OGV4?=
 =?utf-8?B?TlhwRFhYWDlHQVpONGdwdCtDc3RLUEQvYU1hSHRhakRreWdjNCszTFh2NzAv?=
 =?utf-8?B?UlZYemgxajhoTTNYM094YTJBN09teURJR0UzRkxOeUY2eUV0RjdPekNHMDE3?=
 =?utf-8?B?UU9DRzVLSXRmTEdIRU42UGtBWGVOQmV5L2x1WE9PM3ZwcklNellpZjRxRHox?=
 =?utf-8?B?M2wyZXRhQzN5MDA2SDJRVUNRbXVPMnJjeWtKWXorSjZiU1o2VHBPS1NsTU9H?=
 =?utf-8?B?U3BaanZVdDE1b2diYmlQWThMN1N4bmprWTdlTVBEUWhkV25lRDh1WjNSWFVR?=
 =?utf-8?B?cldvN0paRzV6d25PNUtZNTBBWmt6blJXTWZYekpVRFh6dXpob2Y1dlhIZGth?=
 =?utf-8?B?NnlnVTBVZnpTYWVhZ2xaUVVtMHM3OWhDZFNNVVFYRTA3NDZyUHV6bUxrd21U?=
 =?utf-8?B?TVF0SzVsWmtpSHBjenAwQmxEd0laOFVWOVBJQW9jQXcxSjFJMjlCb3NDMVE0?=
 =?utf-8?B?L2syNS9RRXRYMDZndHNEZ2RQYmxOME93L2NpOTBLaHcvQ0R1ZUxxeEZZeXR3?=
 =?utf-8?B?am1nWXgwb0lrTFl6L0dPZHVLTEh1OG83OHpWdU5STnpCZFdNWHprVU1ta1dR?=
 =?utf-8?B?b0R2VlFRdWFRZGFyZ01QQzRtb2pITzc1bkp6SnQwTTlXUGNZbS9xVGdzbjBC?=
 =?utf-8?B?U0xQS0NxTmxnVzIraTV1L3M4dGhCVTFUSlFXbDNxZDBiQW1IWFRxMHdabElk?=
 =?utf-8?B?NHhFUnEzWlAzWGNpU2s5QmFUQzc2MEgxUlFPVisvWEFLVHV1emlqUFp1WkRF?=
 =?utf-8?B?TDNMVEh5cDJFV2xYVXNFczJOaTJYQVRzVWRkejV2cjNPZ3lEc2FSc1BpdWRE?=
 =?utf-8?B?ZG54RFQyWjhEN0dwOGpXcThEenVjeHpObkRtemgzYng3S1VWbUVlcDRGNnJT?=
 =?utf-8?B?SjJkMjAvMk5wTUFMZmRWckR1ems0dDBpRTJqaS9kT2t2aUlha2tIUXNnbW1K?=
 =?utf-8?B?cHlHSE1aeU5sK04ycHZnQnRNSjl0bjYyMGhJRHo1a1hJaW5uY3dhbVJpZisx?=
 =?utf-8?B?TVlqYW9UMGRpM05WR1lBaVd0SFI3bmc0MExsYkd5dk4wSTZnNTUyZHJQamVS?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adcd5c2-58e6-4132-c514-08dc392da302
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 13:52:15.2859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHWmEWgHn1hyrp3Qk3sEEzRNXzDdVBYsjrrY0NYf+nX91sPibrVL8QR/ot+ZVJaaMOmNm61SE6orjOM/cyqaiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8755



On 28/02/2024 20:12, Christoph Hellwig wrote:
> Split the logic to query the Identify Namespace Data Structure, NVM
> Command Set into a separate helper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/host/core.c | 38 ++++++++++++++++++++++++++------------
>   1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 78667ba89ec491..adcd11720d1bb4 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -1831,12 +1831,35 @@ static bool nvme_ns_ids_equal(struct nvme_ns_ids *a, struct nvme_ns_ids *b)
>   		a->csi == b->csi;
>   }
>   
> +static int nvme_identify_ns_nvm(struct nvme_ctrl *ctrl, unsigned int nsid,
> +		struct nvme_id_ns_nvm **nvmp)
> +{
> +	struct nvme_command c = {
> +		.identify.opcode	= nvme_admin_identify,
> +		.identify.nsid		= cpu_to_le32(nsid),
> +		.identify.cns		= NVME_ID_CNS_CS_NS,
> +		.identify.csi		= NVME_CSI_NVM,
> +	};
> +	struct nvme_id_ns_nvm *nvm;
> +	int ret;
> +
> +	nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!nvm)
> +		return -ENOMEM;
> +
> +	ret = nvme_submit_sync_cmd(ctrl->admin_q, &c, nvm, sizeof(*nvm));
> +	if (ret)
> +		kfree(nvm);
> +	else
> +		*nvmp = nvm;
> +	return ret;
> +}
> +
>   static int nvme_init_ms(struct nvme_ctrl *ctrl, struct nvme_ns_head *head,
>   		struct nvme_id_ns *id)
>   {
>   	bool first = id->dps & NVME_NS_DPS_PI_FIRST;
>   	unsigned lbaf = nvme_lbaf_index(id->flbas);
> -	struct nvme_command c = { };
>   	struct nvme_id_ns_nvm *nvm;
>   	int ret = 0;
>   	u32 elbaf;
> @@ -1849,18 +1872,9 @@ static int nvme_init_ms(struct nvme_ctrl *ctrl, struct nvme_ns_head *head,
>   		goto set_pi;
>   	}
>   
> -	nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> -	if (!nvm)
> -		return -ENOMEM;
> -
> -	c.identify.opcode = nvme_admin_identify;
> -	c.identify.nsid = cpu_to_le32(head->ns_id);
> -	c.identify.cns = NVME_ID_CNS_CS_NS;
> -	c.identify.csi = NVME_CSI_NVM;
> -
> -	ret = nvme_submit_sync_cmd(ctrl->admin_q, &c, nvm, sizeof(*nvm));
> +	ret = nvme_identify_ns_nvm(ctrl, head->ns_id, &nvm);
>   	if (ret)
> -		goto free_data;
> +		goto set_pi;
>   
>   	elbaf = le32_to_cpu(nvm->elbaf[lbaf]);

I actually had a similar logic in one of the patches of the PI series 
I've sent :)
BTW, we need only the elbaf field from the nvm response structure so we 
can ease the code a bit and free the nvm inside the 
nvme_identify_ns_nvm() instead of in the caller...

Otherwise, looks good
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>

>   
