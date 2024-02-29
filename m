Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323479DD9
	for <asahi@lists.linux.dev>; Thu, 29 Feb 2024 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709203727; cv=fail; b=NTv0tUh1vsq4epddbiQEdyGljTSjjCdbH30x6sZq/s9vRjoSejgOaNPVEIA+808vzm9LIz+GccCyHkYfSTYrOPGeiJieUa3Ond0WS7bzW2ImplTjhfk8B+seaeakpddA4LYnPkBKPfxWzWLar1us9qyokJkJeJDNEUQMdDZXBFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709203727; c=relaxed/simple;
	bh=KT1l8PSqUWACSAIAIVrg0dQuXvPa24P55lcGYb280oA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oOysrQuwoEeC3r8tmIQsIQx5kYwHCz3bS2ofBsvN6FkzzjE6XpQwWjPq46BcHc8LLNLOVTXQCVPrxjFfxr8UIlgg6vHvCDK5KFNfs9Z/q7tC0y8sOEWG1V9vD3IOJ5xfKP4/+GPDjmub5nGXkM8QULKPjeXNrz8+IF7InzgQdQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IRKKaCVf; arc=fail smtp.client-ip=40.107.236.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IRKKaCVf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MflH3XgoGtVghsbUn4liwxGb01bANvHJvx244F61s/iLlLn1gBtwqasglNjQgoAVXUaEKwlU+lKNMdOPm7dDAVUHFedBdEAx4rUizNhNY+K++xIyl9xwnmgpZS+iOP6VZEr7STBH1EARKeNvRDx7s380AYtsHXyIsJtwLjGpodXKQGckqZ82OMq1fKsCSvHSRvfkCIRa2Cwpp9pdStxq67ikcqyncWk8Bug+PdUU4rR34wIsAzYtfhYHRi72KnKDiYVfVBKo8xJ2aPMjTY0534wkH2SU7t+A61cVtQQwQ80cVxnC6shLfF1bo3HJ5XvfXk8ojY87dhF+ZIhTIGMO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmOFprUJuU+BX9AHpd2WQveZSGRRS/bNk3pYU6iMHUk=;
 b=KtnmHp61osgb+IQgGB29kBCalpoDoDPubXms5tbc45Iy7Odikt4YR1s7qBR6ow6sClJ+bfZbU5AuZgjowxfNV5kwEsZKdWOFc36UUY8He9r/w9nSWMn+NM0Z/E2zMDvkLH/DuvXnJznoHZUCy/LR8oZXUexGePBbq3xpG9Dc5CzQ5ShQwBkBQdZMfgMXdDPQt1yfkbvxZv5qVlkTgsy/kvD+JR+/Or2ygWmYpA7zKFEq0WlcYW5MINjkTadanlk6Rv11ouFSuXzkh500zPVI787GAE/lmuQBsVXVT8zCRsFPRw7Hb/vERu0N/bRt1DjvnCcGXNqLuuqedAnW7ZMzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmOFprUJuU+BX9AHpd2WQveZSGRRS/bNk3pYU6iMHUk=;
 b=IRKKaCVf5oSDHZi4EmD8ceKiRLa/SiBLykOk50rS4EJoZITAuKtJtG5kapsoa331wkRo+D6q0od8nlD9dlvTW5DX/7JpIcp3wPUj3TQL5jLxGhR3fkFwTawTod0491UG1ersO7yEKgZtnH7n/OKEoBLvL10fOVruzwZ12wMILyXCYQ3DOIkspEPr/b37TJxe9xMbUf5PciGSshNZdJh9x/IvAv3WqHVI7ZSYlwgCXYdeTqFWIyHyhMSMZDvZpRePWsbdy/xrHEHvSSU6xYdDs4uQvPesw9QwcPiHqQoNXhrTCunVZgucbEnJyb9gKCuNr7ThhzJM++G37FqgyE2kCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Thu, 29 Feb
 2024 10:48:41 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1%3]) with mapi id 15.20.7316.039; Thu, 29 Feb 2024
 10:48:41 +0000
Message-ID: <70dd2ff7-6ef3-490b-be43-b2fff5d6cf3b@nvidia.com>
Date: Thu, 29 Feb 2024 12:48:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/21] nvme: move NVME_QUIRK_DEALLOCATE_ZEROES out of
 nvme_config_discard
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20240228181215.873854-1-hch@lst.de>
 <20240228181215.873854-5-hch@lst.de>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20240228181215.873854-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0320.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::19) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: a44c040c-a451-4c97-3e88-08dc3913fdfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7BIsTWR4XDhzKYkD3alWnjIOvp+aqZ/6CaUXc28TgP5r2I40Up2eQM+A0oeHgyXD5iVfYiJvgYU++aainaJtoqFBh/3ZMLn4e8Gu1cXSv0uayhegfLSY9Lr/hKlYH+EY4JqhkHdwFfRsPPiGaIUlhg/APQzrLmK2vK4zquKRkehDMRZKbIDmj3Pnhk3biv6rIgESg+pV+9G/iF0H7RSJipPhs71oejcZG86v24NEIPy/vdgl322gEuabZB1lfrUYPDEIbGtQNmRYXKk2FKoD5rH0C7DMeZ7dZt9uDVdo2tYFM+IUjyJAOLzBtLn9K9RQCi4OfZ9DhG8TToH6w2LjejAbm7YvyRp6PQwXoLXjfTIghJiOMISPyIfrsO9DBJRQwMUzas2z4b8T4IdyHF+ZLum/8ybM1DdNiUKoYN6rqvB0kTphvPLY4zbnyWGQFugUvhrGfCKG/4/tZttCrIq7f+5xS9f6S2obLwhzES6q6+B/hDHUJIRJPlA5VIfGy5+ZBgFlk3xv9g10qWZL7Qmj41nmrPhDlD5Mm6sgDDzXDilVOw8yVc5jrMImZHzKBaKEkus3uSmzL9nPAIAX6My/1FMMzvapvvGq2bXLYxVuwkr30eeTey9z8albgpXHTXWot58GRLwyf+5c+q/k/yG9Ig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nzk4ci93akdzcGsxWndGeGZaRDBrNHUxZ1BXdkpEQUJZOFMraHg2OEI3Q2Qw?=
 =?utf-8?B?Y3lHdUJXcEJoMy9mcWFyeHM5WlB5eU9rQnQzUmpreVE3RWdlKzJoQ3lrL0lv?=
 =?utf-8?B?WFkwSHQ5bWhPNkdtYmJNVVMwQXhSRGJZMHh4QUxTaUcyb0RPNzlzR2Fkcmlt?=
 =?utf-8?B?ei95Ni9acjlLeXhpM2h6T0ZtNS96YlZqVmRCVVluZXp5Rm8vNS9sbGQvbGN1?=
 =?utf-8?B?TU5DUVBuZUc0QW9vQlJKTzhJektzZ3NxZXZ4WE5pUnZ1OCsyNXpOTjJrQTdR?=
 =?utf-8?B?Ukx2N2g1Y0x0V2xsZXB3N3VQaTI3cE9ONUQrWXMvK3hyR3lTK2VqRk9ocGt6?=
 =?utf-8?B?L00vbjl6YmxyRmRTNHozbnZJcTZVK2V1Qm1rRDJOckpIUWJjL2FtUWR2WlZz?=
 =?utf-8?B?N1krUWFJNnlybUdoMlZIZkxwck1qNnZWRFZ6THIyb05CNys5VTE1Qlp4Z3Fk?=
 =?utf-8?B?R1ltUGJmdHZTb1JFTTdZR2J5L1FjTTdpZGVLaWhmOS9QZ1R0ZW1vVCtmQUtt?=
 =?utf-8?B?b0pCbWI2aEQ2dGJoRlAxV0xqamVqTWplWmt6NUJ3SHZMaWZLbi9CT2sydWkx?=
 =?utf-8?B?NXg0eUxZSThFT2ZaUzdmUWI1NDJvOXprUGowcHgzWTdyRDBMUWxYem03cGxp?=
 =?utf-8?B?TzIzV3Bad3JUNkJQbUZmKzZLb0hwQndXRzc1eGNSbFRHMEhZUmhoZjZNRWEr?=
 =?utf-8?B?akNvazRzUWZCR2JpRURKUG9xWlBidDU2OXRxYkRVYksvazZqeElnK0FKdWx1?=
 =?utf-8?B?TURDVjhiSm1LUFpVK2RaclRLV3RLT1VaeUxFYVI0QWlFbC9neHdNT3FMR2pn?=
 =?utf-8?B?bTNuaGFpRTBtTmZMbFhrdEI0dmRaRXl6MWNvUTV4eDdpOUtXdVJ4czduSmps?=
 =?utf-8?B?Rjh2QTJ0T0lGL0NOWUp2bWVXVnh5dGZKcnp4OXZLS3kzZ0RxWGNMZ3dqU1g0?=
 =?utf-8?B?a1RhK0lvdExvYlhFZXlEYmk0QUtvaDJwN21UWGU3ZHhBQjZiSXo4Ym5YU0hu?=
 =?utf-8?B?UCtQY3U5MTJ3Nm5vTzF2UU1pb2pYaTFLL1M4UEQ4SDkwV0NrdkY5WHIxMGFa?=
 =?utf-8?B?WVZrM3dPK1plK3VvcVcyY2xWd2wyTEVldGovNnI4VmY2c1I3MDRVcFhwVVph?=
 =?utf-8?B?K0gxMTBBQjltdTRSWGhCSmxaY2p5NE1XSUlDU1VMelAxdUlXTnZMRms5Rmpk?=
 =?utf-8?B?NlhEclhsRGs5NTJjb1VaV0hzUmhXWFM1YVFMK2pHazk0YlVabVEzWHk5N3Yz?=
 =?utf-8?B?Y0NqWm5nUzE4bXZvNkxQR21ING1uMXJ1czRRMkt4RG91QjJBVmU2dXNEdGdz?=
 =?utf-8?B?cG9UckM5dkE2TG83ZWNXKzFYejN6TDBVNG45R1V2WEFNa055cS94MmNsTFVi?=
 =?utf-8?B?L0w0dEczWko3eUhjZ0E0N3NGSyt6TUpNNFVNRm1CQm55VkdYQXRLSFg2VzJU?=
 =?utf-8?B?eEZYU3F1SlljeXpnMkNNT2NQb3pCNHEzQkJaRXN2WmhDY3RtdkFsNzJnTm94?=
 =?utf-8?B?RnJBbHRNQWxUMWFJYnJNSFFKSk5ZbXh5K250SDRDNkd6cXhGb1ZFRkZhdjNp?=
 =?utf-8?B?OHYrdFF0MVJmdHBMOVl5ck1nTEdsV2NvSHBza2cxMjhRV3JYOXB0ek9FREM3?=
 =?utf-8?B?TVVKQ0FNeS9ucWo5OXVra2xjSnRnaHYzUzNBNGE1c2RiNXRDVUhHV0hEbDYx?=
 =?utf-8?B?SElVSGs5L1IyTGg0UVlUd0lja0czVk9lZUZqVHZiSlBEMGppRDYzWjc4cTQy?=
 =?utf-8?B?TnAzVXdDeDhJR1BCbXYwbFdSdFkwSEhCRnNSQklLWGUvaGY5Nlo3ODU3SmhZ?=
 =?utf-8?B?cXBDNVpGbGhFOU1ZOGR4YnZ5OHNkY2YyNkxESnJUUDZEZWJSem03NUkzTS9r?=
 =?utf-8?B?RXczVjV1OVF3c3JNNjBQRjROajRBNEhwSzRJNjJXNmFlbzY0dGhpWThkZG43?=
 =?utf-8?B?c1NlK3B2TjdrTi9BM0xnM0I4K2dsQ0VHK25ydmtFUEN1VHV6VjU4TWR4WDJk?=
 =?utf-8?B?VGRHcXlSQm1xUElWRE5CUnlMaXJNZFJzazhVeXR1UXNqaVNXeXJRRmlFVWQw?=
 =?utf-8?B?aGJmdHVCWm1JVFJaNXFrakpSWFJuWFd0Z3FCRE92WDdiNkppYXYxL3VpcVJq?=
 =?utf-8?B?R3EreDdZVzJyR1JwelZid1k0cVVBRjI2ZVBJWWhJTTFxZ21Sb0Y1MElFZzAv?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44c040c-a451-4c97-3e88-08dc3913fdfa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:48:41.0099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjFDiaVLZ5rLj5NNgTMH5fRvv4Nx1htOzpG/01BS64MAgLO5QE9+xWo8BuLleDRrFGyfl7FgSKaZC7I3tcJ7CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805



On 28/02/2024 20:11, Christoph Hellwig wrote:
> Move the handling of the NVME_QUIRK_DEALLOCATE_ZEROES quirk out of
> nvme_config_discard so that it is combined with the normal write_zeroes
> limit handling.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/host/core.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 74cd384ca5fc73..ee1e13a658c314 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -1816,9 +1816,6 @@ static void nvme_config_discard(struct nvme_ctrl *ctrl, struct gendisk *disk,
>   	else
>   		blk_queue_max_discard_segments(queue, NVME_DSM_MAX_RANGES);
>   	queue->limits.discard_granularity = queue_logical_block_size(queue);
> -
> -	if (ctrl->quirks & NVME_QUIRK_DEALLOCATE_ZEROES)
> -		blk_queue_max_write_zeroes_sectors(queue, UINT_MAX);
>   }
>   
>   static bool nvme_ns_ids_equal(struct nvme_ns_ids *a, struct nvme_ns_ids *b)
> @@ -2029,8 +2026,12 @@ static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
>   	set_capacity_and_notify(disk, capacity);
>   
>   	nvme_config_discard(ctrl, disk, head);
> -	blk_queue_max_write_zeroes_sectors(disk->queue,
> -					   ctrl->max_zeroes_sectors);
> +
> +	if (ctrl->quirks & NVME_QUIRK_DEALLOCATE_ZEROES)
> +		blk_queue_max_write_zeroes_sectors(disk->queue, UINT_MAX);
> +	else
> +		blk_queue_max_write_zeroes_sectors(disk->queue,
> +				ctrl->max_zeroes_sectors);
>   }
>   
>   static bool nvme_ns_is_readonly(struct nvme_ns *ns, struct nvme_ns_info *info)

Looks good,
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
