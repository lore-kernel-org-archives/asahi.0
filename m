Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A604A23
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 02:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709085984; cv=none; b=foG2fhr5iQiDIGtR72qd7XLlExEFuWd1X60KgGsMfSX8UC6GGpaA+gzzAl/jgp8+0Ubc079M9ZEsG3AyzP4WIS7nb74gt/WINPCPc/aDEUzW0LMXWvdNtClNhGZK5+IF3TOpsG4CpDyA9m08Cy+Tg9TXP9RrbQAHZPzYrQehoZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709085984; c=relaxed/simple;
	bh=tU4y3J8zVMd5QfhtV8M5FVK9IAtu0tz/78Ppn6PVxNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iLy6AajAFnqHc4EObNEWUmjoreZ26YFOwqICkzaU0TnWdXY87LHdd7Ee3H5J5suNSG3nKI4GJcwIX964nZXzP+tQYu3NPHVkBJd6kXTU0cSvdzyHPz7xuXXI2NL75MjaTt/1ye1HofeK1P8ATfYkzEOl/V42faKR9lnLCpZ3r58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TkyNJ0r5HzNls1;
	Wed, 28 Feb 2024 10:04:48 +0800 (CST)
Received: from dggpeml500019.china.huawei.com (unknown [7.185.36.137])
	by mail.maildlp.com (Postfix) with ESMTPS id 513F3140499;
	Wed, 28 Feb 2024 10:06:18 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by dggpeml500019.china.huawei.com
 (7.185.36.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 10:06:17 +0800
Message-ID: <91118802-eb8c-6225-3610-05e16270b3c4@hisilicon.com>
Date: Wed, 28 Feb 2024 10:06:17 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 0/2] Fix per-policy boost behavior
To: Sibi Sankar <quic_sibis@quicinc.com>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<quic_rgottimu@quicinc.com>, <linux-arm-kernel@lists.infradead.org>,
	<asahi@lists.linux.dev>, <linux-pm@vger.kernel.org>,
	<dietmar.eggemann@arm.com>, <marcan@marcan.st>, <sven@svenpeter.dev>,
	<alyssa@rosenzweig.io>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
	<xuwei5@hisilicon.com>
References: <20240227165309.620422-1-quic_sibis@quicinc.com>
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20240227165309.620422-1-quic_sibis@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500019.china.huawei.com (7.185.36.137)

Hi Sibi,

Thanks for pointing this issue out.

However, I can't clearly see how the existing code fails.

cpufreq_frequency_table_cpuinfo() checks cpufreq_boost_enabled(),
and that should be already set in cpufreq_boost_trigger_state() before
calling cpufreq_boost_set_sw(), so presumably cpufreq_boost_set_sw()
is supposed to work as expected.

Can you explain this a bit further?

Cheers,
Jie

On 28/02/2024 00:53, Sibi Sankar wrote:
> Fix per-policy boost behavior by incorporating per-policy boost flag
> in the policy->max calculation and setting the correct per-policy
> boost_enabled value on devices that use cpufreq_enable_boost_support().
>
> Logs reported-by Dietmar Eggemann [1]:
>
> [1] https://lore.kernel.org/lkml/265e5f2c-9b45-420f-89b1-44369aeb8418@arm.com/
>
> Sibi Sankar (2):
>    cpufreq: Fix per-policy boost behavior on SoCs using
>      cpufreq_boost_set_sw
>    cpufreq: apple-soc: Align per-policy and global boost flags
>
>   drivers/cpufreq/apple-soc-cpufreq.c |  1 +
>   drivers/cpufreq/cpufreq.c           | 15 +++++++++------
>   drivers/cpufreq/freq_table.c        |  2 +-
>   3 files changed, 11 insertions(+), 7 deletions(-)
>

