Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0C27CF20
	for <asahi@lists.linux.dev>; Thu, 29 Feb 2024 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709210210; cv=fail; b=rSQhQuBJ49oBsKg5F2DwE+zhA7RbuqjMggoyY+5+ybKLI2+Li6cqbYi+uJNANKxnUgEXx8HOIHw2TSxpNogVV1TeEeHM3Vphd6fDlGPwDdMnY2DMzLFJ8n1hrxYIQ6CShVELOIjDSPam1mh4/RhRtbhrQGKU6auKUSFo4GTttiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709210210; c=relaxed/simple;
	bh=FCIbFLpP9F/NFrfJCGBpk0IKhTXYV0i9TM9TNYeWYcA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y4uFQCT43xImTCHNH4JPl+X1DCIjhXrZe5DQBJCQcvZlC0bP7DkUS+Nq+8/cEGZY2Lk0BAxuy4bBY6uzQPlNWPGO++EfCPL4kIMWWobw2fpO6H1GHfMka+k12cl29dC3CiJxfHuqUNbTDpSan048MK3VT+pfNUlbCA5NjqeBYnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n5/jSOHA; arc=fail smtp.client-ip=40.107.243.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n5/jSOHA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iA64IZfDG2kfR2ff46VJQkd1n9oYQl9HeUFB5OVQe207CvvqdJ2wFU5gGlkdZEeIiK/0cjzRDGD5tj3I8DTjtBqWXtqXggeztHlODZZpeixIeyy0a+BzaxqZ9/2Uuu4GcTjXOqziuuEhEiRvE6t1GcmKSGeRjjX0go4EuuMNGtqTbxoFBc2dHxXF+KZ2xppFY3Kd6Nw1tqsje7MjgYIj4RY/k1aVNZLMqXtx4Svyrrg3VyNsKJU7SSnggtO347U7Eu4EMeR8/YFAAl1vJPlra1Kq5hKQ3CESt3O8uGjjBu8gfxnPq2YjZtzmY1iKsc0+Lvp8tFWWZsaSNz9LeWTqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlU894/MSa6j9Y2rUhWCuR5APkty9AQvvl59YHRTdO8=;
 b=DhFaNFB9zQS/pnEl220onV40W/R0Lhy7zDvARlG9u8haYCH/xQHMWzB8a2xCtA3OPNZM8LL+07t6ZlGz3fpLyWF7Y6vkLjE2OQH95C45EwdeTs3tGl9iwhKbeRKMMzKrUQSqsz2fFZQUFddDy4Dfql8HEjMRZ0cl7Io5FtVY5PpQLxvvxe2Eky/dQZ3PqxLZlPyxAkVfKftFdf7pLG2TpK5lSi4XoTbTGmTXpyAgvesyohsXVakxipVniOUKQXu3lCknDyax4rkDnq0PNpiDDWqVTIXrjsmKHUjP3lrisow7vMsTQJ2Vp6Gzl3+0ysUJyGLob1eiseK+zcGjlvyIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlU894/MSa6j9Y2rUhWCuR5APkty9AQvvl59YHRTdO8=;
 b=n5/jSOHA1mVC7WcYuPKQxzYeJninj6JyPs1NevkPJE0/DF2cLXZcAuAUNmkAXZFhAPZdEhj/Gf+2STSABRI1CFhJp9iQNcOkEzS1rYIIciL0ZAyEKDlbumuOlFqq0nyOslOyBDtAHCHZpVyNIDeUn6DrxrCRJs2KL5ogCRxTD+A6WLFug3pLA9iqlfwXiU185R62bx/sBu+Fwv65+zH9FXXlDA1J+msR2qpQCvKyVUhtK0H0uWORbNsgMJpQPfRzQsQh4t/rowAufgM34XFA+AUlhqUtsCyZG3yXw5wGLPzy1LyAoclkmDTObIoVYW8LfScDKhwyf84ntScFJZGzPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Thu, 29 Feb
 2024 12:36:45 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1%3]) with mapi id 15.20.7316.039; Thu, 29 Feb 2024
 12:36:45 +0000
Message-ID: <41615535-70da-4b6f-a643-97133d55defa@nvidia.com>
Date: Thu, 29 Feb 2024 14:36:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] nvme: move blk_integrity_unregister into
 nvme_init_integrity
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20240228181215.873854-1-hch@lst.de>
 <20240228181215.873854-9-hch@lst.de>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20240228181215.873854-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ed3a1a-91ee-4162-2ba4-08dc392316da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SX8fsdkAcb23grg/phHUtS2HaJ2OlZv4QsYg/fMG7+mbYzEZc+h1JiEiGAlYu1jZFh7i9SFqjeyoejG/71L54/ZpbD8ukCDlBdaVom/5+x0pMmsthdLlBoP0p2tKmGw0pLzKFzNXobRW7Sjk6ZfIKd4Qnwa/gPAfLc/ML9iWU8cVGGSzczAMGLZ2GdxsCI+paC8j/eWhgKU4yiE1hLYabYxsNjvLGPGV5JSU86vwW7uc3UYYNA5N/nRSN6SC1K39uVBXkNXooE7yy8mhLBnJkPDcjmkxz8ia2cdTJ9MSU1CZvpaHhRb3J2KQsgyZB0EiaUtPZpEIZNjes381o0f0EqTRCh84VOvVXOaIn1A0Mkwuj2w0RX0Fqk66fl/nx3taVsQfmSW4foCs6Q7QmI+csf+fTjbgxP/nOo5w8Mfh39ZI0CexGTZaiPZ0IhcLPf+tRqMYr8OfGwHMBQvAliPypCDqCy1/tQGVwLB9Lo/LOUoxKTEGT501aKL0OTKoHqF5+4UpNF9hhbIWUcWkN29utqMKAcPItuTjttRFPmeVz/ThaeuUFJNAiD41imcGf5JTuE2OqspVZbfCkQWr62G2Ftubf1UMe3uCq4+uv+8M5JQqnZkgWzjXz++u8urJS2X0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1N4MldGNVF0RHFyZVF5SDlhVXJHNVlrWmxFNlg2VzJmVnVWWGRmUTU1Yk1U?=
 =?utf-8?B?NXNBaU8rTUo4RkpWRWluaTc5ZTdNN3pJaDB2bDI1R2xTU1Q5OWFkb0s4RUV5?=
 =?utf-8?B?eitDK1dwZzByd2JBM3VFdU1QWmdvZlpQV0tuS0JJMSszQTNFckE5WUJRc3VE?=
 =?utf-8?B?bEpLMjJmWVdBMGxGUndOM2o1dWIwQkVES2JlZzRJMEpVc296enJGS0NrNjhq?=
 =?utf-8?B?cVBlc3VRT2tHR0dhZUlvTUNGcVBKd3NvSmRTUjVvclpnQ2hOb2pVWXBzandB?=
 =?utf-8?B?dXBobGV2NlJsNVVTSWNNcEhuRXFhTjdYVHMwTXFoQ1JOMnE5N2cwb1VTTTZx?=
 =?utf-8?B?ZFR4a2lQNGZsNERqdzkraWRuMkczZFFUSkY5Z3plK3JNVTYxTTkwTzMzdEVm?=
 =?utf-8?B?NUJqTmx0Y3c1N1FLMytMbkR0S3BYVm5remc5amtLTG8wY2lJRkZvTkZkQlpj?=
 =?utf-8?B?ejdkMDAxZDRMV1NOOFVkYk9qVFhIUWNNYUJaam80eUtHNmMzMjhnSE1TT1pp?=
 =?utf-8?B?djYrUS9JUVl0RGhxUFlsKzNQN3pGcXFlLzVuKzZOMGY0c200ZGlkRjAzeGJ0?=
 =?utf-8?B?WDE2QlZWelN1MWdxMFdOSXdnQ055d2g2dHU3eDhHM2lzRzZaQU1aTlVPWGRO?=
 =?utf-8?B?MG9nV1M5TkJBSmZ5Z0QwZnFzWmsrekNpcDZLRUtaUGh5ZjBpdjJmUG5ldjlZ?=
 =?utf-8?B?VjFDTWpJODNnVjEySlRneHpVT3pHQXVPWERaUTh2NiswWC9LMDluYkkzSXJy?=
 =?utf-8?B?UjN2OWp5VnpIVGZNV0w5dFM5aEFSbUNINm9zbE8xS0o3azdiM2c2a3VEclZl?=
 =?utf-8?B?a0U4K3JUNUJqZ0JmQ3Q0UmpiZ01rUU01YUUwMTV5dzFkSmVsdnJpM2ZOaHBs?=
 =?utf-8?B?L1VMaU9Fb3NwTjZObGsvYjhKdW9pdU1keXRjdG5zMzRVTlYwK2NmZlBBbFNJ?=
 =?utf-8?B?UmFCY2EwdUxCOFN3Yk1hRzZsWVIzOWFBN21SSVNlNTBFek95LytyRkNuQ2hl?=
 =?utf-8?B?SFlVZ0s1TGRhSXpuWEE5S000bzJVRFNMWEZzeDEveDBLdmplYWJ4TjBkM01r?=
 =?utf-8?B?VVJmdS9JZFg0UHg2WHViRTBoYmY4ak1zdGxmR2k4ckMvYUZkelduNWlWd1Y4?=
 =?utf-8?B?R1dSZStjT1NKdlpQMUo5UUhIb3F0WXNLaEo1M3pVaWlFNW16VStZcldyZ3Zx?=
 =?utf-8?B?dHBKUFJUS0xoZFh4cENhMXdSbE9IbDBocThVVWV2RmFKTDE5L3hqM3l4THVD?=
 =?utf-8?B?dDd3VlF1TVVDbXJnU1N2eVVCbjFlUUs1U3plY25tR2dZcGxVRVh1QkJ5bm41?=
 =?utf-8?B?eVNocWFtOXVMenFvOFVRT2RsbWxjeEM0VU1DTmlFSUYybHVaRmVIM1lZM2lj?=
 =?utf-8?B?WUVXanRNOTMyYnpONnl4VjZtdnZENXFQRkhCOUtPNyt6d2I5ajF3TTM5Qkc1?=
 =?utf-8?B?UmRBNkRMeGo4UVhEWEhsSVZSdHBOQmFXaGZZTlJWRHAvZWZQMGx6a3hyN3ZY?=
 =?utf-8?B?TWdpa0t5VHcxcXR0eXZpcDhOei9ObWx6Tlk3SmlDZXpzTm9ZeUZRZTQxWm5C?=
 =?utf-8?B?K0tFa1NyT0lGV1NlMUpQUnJFZ1NMeXMwTHI0bXBYWFVRYUhpbWFibkFEUW5W?=
 =?utf-8?B?VXEza1lwbVZhZmpIWm91UDM3T0VyWkdMbC82MTUreWhkK0JDblU2V1pCa2Jm?=
 =?utf-8?B?Z3VJZTBETGFiU0hZL0xtVXJVanQ1eFUvaGdtWXQyNVVhNFNKOVo1cUN6NDE3?=
 =?utf-8?B?YlYxNnNqdXNGbjdEcGk3TThNNTQySnNzVGF6OElCck1QZU0rUE1jaHVIellI?=
 =?utf-8?B?Yzk5Zmkyb3VBbFJxNHREeHEyZDNxR0xiU0hqQi9WYTIrY09abER5a2ZCckkz?=
 =?utf-8?B?eElydzBTM2pZd3prbjdaVmpyOVI5S3NackRiZnJHTWpCbURHV0haTTZQc2tT?=
 =?utf-8?B?UU9odXpCYUpxcy8rWDhPOXJIOTBLTjROSElxY1FKUktpTllhRnQzRXUxRGp5?=
 =?utf-8?B?NkV3dHlLamFTVDJRY0pkeGRHK0pqRklKQ1ZtVW1rWDR0ZWkybzl3MGpGd0pr?=
 =?utf-8?B?M0REZURwUFljL3UyU1ZvTTFpSjd4a1VBdkhyZkdZV1JmQjMwVzIwcmprV0d1?=
 =?utf-8?B?RS9maE81VXlhRlJ0OUNLMzI4cFBrM1NDT3ZKZytVb1hqZU5Vb013M2Y2SGpm?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ed3a1a-91ee-4162-2ba4-08dc392316da
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 12:36:45.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uyqhekM+Hf9geNAOTuwvhyiDenM9w0k7NDdjcrVwELatRPIKnGLCdF6w6JoGbtsEsrPq+PPVT531wGmUoiqFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447



On 28/02/2024 20:12, Christoph Hellwig wrote:
> Move uneregistering the existing integrity profile into the helper
> dealing with all the other integrity / metadata setup.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/host/core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 76e548902ec33e..105046a7957272 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -1727,6 +1727,8 @@ static bool nvme_init_integrity(struct gendisk *disk, struct nvme_ns_head *head)
>   {
>   	struct blk_integrity integrity = { };
>   
> +	blk_integrity_unregister(disk);
> +
>   	if (!head->ms)
>   		return true;
>   
> @@ -1980,8 +1982,6 @@ static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
>   		bs = (1 << 9);
>   	}
>   
> -	blk_integrity_unregister(disk);
> -
>   	atomic_bs = phys_bs = bs;
>   	if (id->nabo == 0) {
>   		/*

Looks good,
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
