Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386F77E0F0
	for <asahi@lists.linux.dev>; Thu, 29 Feb 2024 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212286; cv=fail; b=YqgagcharXhntPRP4fMTJNfBvZxPfkgx1IxYI8LCj5OWaR6oyn8mK1wSRAQpd9jRSFo1e2oL59J9+m8Kngr+WtbQiUeWokB9V5TN1g+8TToBkfg5kR4tmlvmyrFRhfgBnXJUxlyVFuf1/6AruslWEgXDPysC95Jc2gyBib4nrVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212286; c=relaxed/simple;
	bh=h9Mqi5+WiWVLTJcCQO5MppoVdC4o/rdvEzc5yum9RMU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nVLPJgSX0C9Sv0Zh1X0zPraP/kZhYzjlMjcZ64e3SlwdrtkUFfhuLh/f7rSAEWeDu3ptRFBTIzpErvDVJXMIS3g70jwz3/fbAvLNLcXgqs7bL+v7MWe6wQl26m/lL9ycCPAlJx25UWwpL913QBCZlYR5Z8PhSxT9MJWJ5Kw4T8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dw+KIoZB; arc=fail smtp.client-ip=40.107.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dw+KIoZB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3ES5n/OG0teiOdJzb7kMlfsJdos7O0Zj2JOO7gdARww8KnagPK0nDR+wkWh6NSfMhCDTDGU6QYAMWox048ziEIcydi/HoT2ask06YQ+eU2/hVJAtSnpc8+ahg2FjOEKwZubYYaZM+/4TCIJxxt//Cmk5s2HyCn6kcbqakwE7F3/QVJMWR80T0xDpDZ/oE6HMJ4IaSxus5pabEFvIekJJ3hKYhyXex1D8XdqLuZ1XaiKjXJBX4TdHPeTfIuiZ1T7U094HeCUQ3iDZS+u/LVeAbVef7u1mwGjVYvhXT6nR2Jzp6MFurIpCqfjFtNCxw97GB9xkfzKkxyQ/VHtrgDwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPOCn9YNcv3gRVZ2qwgqfYumVsH6tppU/mpzTX1J7Z8=;
 b=MqEpX9z+hHa7PTP8gApHhe1DN3+tqUe0hs1f2UWWYlzrfzsOdFGFBLovuadwa56fumKGGoRTWkpNOecUVTjF0NOrV1WLgwyjV6NjbswwU38zKlX0CC7h9sWDtNR7tdgbIukLbwrVRAr/KlWpphzBsOyrJoitdACENr9coYgyUvMspB0BKwcNuwiQ+4Bn7JGNZl8FGHdLji76/Gg0NyfJYLKOJvVWYOUS3vZnK8MaOl72nSYTWVit7Vluz0/FCt7YUIB8Elyjc2VMdAdrOldQpG3XZjG7Z3kEDAg4VNzFQxxnX9F32xw5u4DPVF10NA8o4hntIl4kRHwf8tq9GZvKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPOCn9YNcv3gRVZ2qwgqfYumVsH6tppU/mpzTX1J7Z8=;
 b=Dw+KIoZBkTKbrd/IpcFoRaiEkTO1qutV5IB47rYmL8LK5lUNqtGVWeMthyDegcc9XrtY79iYI2f+0PazdA9x+zG/os2n+game5vJEYtjQ+oMBTJYPX5xF8sSELzGZBnP9O54dgg9iU8JPmyHxnWVtF/Zc4WlA+4mRqDcCIXmminTjQvFx45d0Q8MvUXSlGEWTfEbWwsZnuEkzRJuR62jQLZ4I1MNJqOtgBQJzdzdbnVEcVo5A0ghoQJQyTn2SJkHm71oUczrHsQf4kH5ACPc9uL3iet6jI7LplafcABjNqxbXWEA3f5bHa4ho55FtFa006XbfgXPCg6T0kbThIuqng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM6PR12MB4339.namprd12.prod.outlook.com (2603:10b6:5:2af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Thu, 29 Feb
 2024 13:11:19 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1%3]) with mapi id 15.20.7316.039; Thu, 29 Feb 2024
 13:11:18 +0000
Message-ID: <a1ba5b69-a7f0-4754-90e8-2bb433dbb3e3@nvidia.com>
Date: Thu, 29 Feb 2024 15:11:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/21] nvme: move setting the write cache flags out of
 nvme_set_queue_limits
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20240228181215.873854-1-hch@lst.de>
 <20240228181215.873854-12-hch@lst.de>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20240228181215.873854-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0659.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::11) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DM6PR12MB4339:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a331a2-c3f4-40d4-da3f-08dc3927eae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YoQgomRQyEHSNXbQ3HVKN4ocXZJm0lKoD6qlfkQp+ivGZAEty2usS+NXYmf64NbZ/UjP6+tRfrK33Cx1act+TIEsjfLmPIPfT2o4OuuYBYTie9DIaSiNVLt4kjFUl2Pp9orBl/T2hEB/cIo+httInzl/UtBIu0BPyqrzL1n7+LYow6b0W+4y5Avh7iF75kz5EB1wKxtGgPng/RWw3XvV2O+m1CRcV5lTRvjrKcxsCJSun2bkwDFh1DJis8wlPDXexnEbumKK347oJsJoZqe9LGomKnflgaHp3ax3RGJDq6Ztt22LWVwLvP0LroNuY65diNFhVzMMfWTO00gQHK4yFzuHVHZKexnYblqzVq0GQpJo2unQfKggNoDUF2PlK6/bAvRf7hQLmyVj2c7oQa0dKGEVJdQXu5CIZ4wE299igqYv2GmfFrOrYN3W+7HxKMk7X54ycOc+9WH81J6l8NcE0HpifTa5MHvD97OOaPT4gqTW4jZYsI6wWkWw24p2HjEglbD07PmiqSg/vCASri6wI6mq5AkOFO+sj2/yezkm4cglVF5wZZNR+nWfLngWRwP569yoSsGsoFi7S9nvQqbjp0r2LlRItA5RTfuP2gx5PmUcfLKw6K8vj3SM7zUVABuh1WonZgGSZqB/AvggmPYWCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUJqTW5DVmI1OTFZZndnUUQzUU9CN2o2TEtJV0JNa3kvSTZIMkxsL2RoUTVI?=
 =?utf-8?B?UlBaRXpVK1paTVdtQzdjb0J1UnJocU4xYkxJaURmWTlXVnQvbG90YzJDdU82?=
 =?utf-8?B?QU1UYW0rV2R2WFA0UHlDNldvUnVhUXpCMG12UXhaaTBRd3FnazRiQ25IV2lI?=
 =?utf-8?B?TmVxVVhqNWZ0NHpOdXZXQUFJT3FTY0dvN2RaMHNHb1h4T0xxaVNmNnVOSkdj?=
 =?utf-8?B?Rkw5YWZhMUtrejRWWW02VUhGWHVNbWRVU3BMazZ2T2txTjRnRjNKU0tGbndw?=
 =?utf-8?B?VlFKVllqRFRIOG5RMGdDVGtxNUI5NTArbS9ZUTV4ajY1TmZ1dndlVXM5Q1Rz?=
 =?utf-8?B?SXM1MnNkYzZWUkRrOGxneVhnL28zblA0SVVKMGF4M2k4SEpMenVrVnlad2hQ?=
 =?utf-8?B?ZkwranVwTjluRWQzc3dSekQ1bXFYUTcrNERKVVpReG80ZHkvVzZUL2dFaWtO?=
 =?utf-8?B?Z1liTmIvNEZHRTQxR1NwRWNIWGIrcXJYL2h6VFZ6OWlUUThwL2FrTFd0V1FJ?=
 =?utf-8?B?ZGMzY3lHTURZUnlCcEFLNXNIQ0xUYktpdmg3U1Y1QnAxMlFVOFZGcSt0aTRv?=
 =?utf-8?B?UXRYSllYd2NkT3F2NzB1RkN3SnZNaTIxTEdSbmUxTjNWbGkwRCt0d05ROXR6?=
 =?utf-8?B?SHl0bDZNaUQxdzJreWVaVlc4UiswZFphbHB5ZTAxbUFCUWZaSFI2M0g3eVpl?=
 =?utf-8?B?VXBJSGEyMEx6N0lLSzZhWHZuM1ZTaytnazZMclk0K25iSExKYVE0RXFCenlD?=
 =?utf-8?B?Tk5QVDhVYVJINHhUdTJJYnJZSVNZTXpLK1pIMlJ2cWQ2STdGSG80U2htU0ll?=
 =?utf-8?B?dWpoZXoxV0dkeXlDcVEyVzNFVllVcWhxTC9uT0U2cEpBQUlsbXh5ZzJPdEoy?=
 =?utf-8?B?QS9BZUNvbVpyK1VLZm9ibkhMZi9sWXZ3Y2luaC8yTzJSZkJrVGRuUmM4UTUx?=
 =?utf-8?B?RTJxU3RZNlcwUi9kNVlJd3F4NjEzdHdSanRrSGRBaXlKbENPTzBRM1NrR3Np?=
 =?utf-8?B?RWcrQmNFVUd1NmY0empXSFc2ZUhyZjBvTUJsSWZNZENOcTZERTZwU2dWTkhI?=
 =?utf-8?B?NGRONnRRSTdraDNyaEJKMC9OazUxWkdoYml5WTIwRkJaN0pJdS9JS0ZjUUx4?=
 =?utf-8?B?UGZTeE5XdjRNZEh4OTkvS29YUEJyaUk4U1VSUFBrWmZmdkFsZ25KWFhJcWs1?=
 =?utf-8?B?bjdqdWhMVjRja0FYdTYyUVZZSGJsTm12V3NLTTBhSHBTcFFTdm1IWURTZmxZ?=
 =?utf-8?B?NGdyYURWVU1pT1gzUWlRYUQ4OStWMW1mU0MxOU1ZVWdWRTZhSUh2ajBFZG0v?=
 =?utf-8?B?QlI4VFZ1Z2hqak5HRmt1K3dxRWpzYmIrdjhWTmpnaTFkZ1BuNW1GTUdlRmxU?=
 =?utf-8?B?QmtWVEpXRW5TSnYrTyt4eU1GM3V5Q1I5Ym5JbUhTZndhaGFjR2xPcFViSEpl?=
 =?utf-8?B?a0xjMG5kVjZTeVF0SGRRYWk5UjVWYnRCSHd5MFhJR3NtcEd3SmtTZlRlY3VK?=
 =?utf-8?B?S0pHcGZscHo0c0ZJZlV5d0NnckRFaTVGOTc3bEJCelAxZVQ4QkNLS3c5RDNx?=
 =?utf-8?B?eFV6SFFWOGhRVlJ1bXJuaFd6WWZXTVl4cERrTjRlNk9hNjdLUmlqTSt6UmFo?=
 =?utf-8?B?TzNWYUxRU09SUTZpS09rNkdXKzdiQzVwNGxlS05lRDI3cTIrblBpM1A1K1RH?=
 =?utf-8?B?L2F5OXdoaHMzUG1NbVFjZXo2UHVyVEZ1bkNQb1l1RFowOHJ3cnZkSDB1MlR3?=
 =?utf-8?B?eTl0SUpIZFNMbGg5Vk95YzRoNWtwLzhmdlRjNVVxc0kxNWJDdmJTN2xYZ1FV?=
 =?utf-8?B?U1pwRHNiR1R2NEM4SXZUUHk2UVFDbE10d0lHS1IwTk1wSk5QTjQ4Z2tqMkMv?=
 =?utf-8?B?ME5Gdm5VVGx4NkRmblRBZG5NMnNVaXdQcjgxNDlJa1gwREp5YXhXbTJYQytL?=
 =?utf-8?B?VmtKaEdOd2VESzFIcjROMnFuU2VvcnhrWHdWd3ZDQ3l6UDRtaEFUdE1Ddzd0?=
 =?utf-8?B?blJSN1JGcjhXWVE2YUsxZVA2bzVxVFdRaHdUTjVPWjFQTzBhNUxwV1lKNHZv?=
 =?utf-8?B?S21Sck5mWWM1d0tmdDN2S3pGQ0RZT1Qvdm5UNENMZ0M0U2pHSEdQMG5iL2RJ?=
 =?utf-8?B?MmltWUJPSUpHRTg5WXpDSUZXMXE5RzRETXEvQ3l4djl3NUQ1QXJGZW1wRERu?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a331a2-c3f4-40d4-da3f-08dc3927eae7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 13:11:18.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/rR3eMM3T4E/emQ0KrwpQRpSn0Tp1/gIdJkjzP8JBHSjEgJrButPMXK8NfNQH7yP+rHQcSgsF9VMFGPocFkPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4339



On 28/02/2024 20:12, Christoph Hellwig wrote:
> nvme_set_queue_limits is used on the admin queue and all gendisks
> including hidden ones that don't support block I/O.  The write cache
> setting on the other hand only makes sense for block I/O.  Move the
> blk_queue_write_cache call to nvme_update_ns_info_block instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/host/core.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 3d839945edd85d..dcb8d0590ed0f3 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -1954,15 +1954,12 @@ static u32 nvme_max_drv_segments(struct nvme_ctrl *ctrl)
>   static void nvme_set_queue_limits(struct nvme_ctrl *ctrl,
>   		struct request_queue *q)
>   {
> -	bool vwc = ctrl->vwc & NVME_CTRL_VWC_PRESENT;
> -
>   	blk_queue_max_hw_sectors(q, ctrl->max_hw_sectors);
>   	blk_queue_max_segments(q, min_t(u32, USHRT_MAX,
>   		min_not_zero(nvme_max_drv_segments(ctrl), ctrl->max_segments)));
>   	blk_queue_max_integrity_segments(q, ctrl->max_integrity_segments);
>   	blk_queue_virt_boundary(q, NVME_CTRL_PAGE_SIZE - 1);
>   	blk_queue_dma_alignment(q, 3);
> -	blk_queue_write_cache(q, vwc, vwc);
>   }
>   
>   static bool nvme_update_disk_info(struct nvme_ns *ns, struct nvme_id_ns *id)
> @@ -2093,6 +2090,7 @@ static int nvme_update_ns_info_generic(struct nvme_ns *ns,
>   static int nvme_update_ns_info_block(struct nvme_ns *ns,
>   		struct nvme_ns_info *info)
>   {
> +	bool vwc = ns->ctrl->vwc & NVME_CTRL_VWC_PRESENT;
>   	struct nvme_id_ns *id;
>   	sector_t capacity;
>   	unsigned lbaf;
> @@ -2154,6 +2152,7 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
>   	if ((id->dlfeat & 0x7) == 0x1 && (id->dlfeat & (1 << 3)))
>   		ns->head->features |= NVME_NS_DEAC;
>   	set_disk_ro(ns->disk, nvme_ns_is_readonly(ns, info));
> +	blk_queue_write_cache(ns->disk->queue, vwc, vwc);
>   	set_bit(NVME_NS_READY, &ns->flags);
>   	blk_mq_unfreeze_queue(ns->disk->queue);

Looks good,
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>

>   
