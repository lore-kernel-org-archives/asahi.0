Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCA71A0BF1;
	Sat, 17 Jan 2026 17:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768672207; cv=none; b=ZtXRvCiYFDioq+EyJ/E8eCz60nAP0ebU+zlApmDsmX+Gnf7uF6kfN7LXbhUtcwlyCs/D/1CSWSdOGmanDzTsa1XoLla5MXovEuxnKdapNSW0tm/w72kH2nGI9HCOqHcvOQB7cuWuia5sbRiP6eX0GBtzXZIuOEUFSNySqju9wf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768672207; c=relaxed/simple;
	bh=TJsszfgPs4dqT47lK9RDmiAoLDpJ3U0lvlDOccNpY5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIqCAsMfDsmk4+Eew9jjjnhiCNe+KWWU7druPoafoxd8npaQewPhsRTelzmyaNuY8FKvTsxlFDmdW1AObW7vkqC6OyKQfGGRx8I51nAaD6g0tbGLl6a2dLtmJfQSDhhqSF9DrEkzQlAoa/eyFIDZGUGrkuYXcu/vO0St4C9fBLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyXPUs7R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyXPUs7R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17154C4CEF7;
	Sat, 17 Jan 2026 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768672207;
	bh=TJsszfgPs4dqT47lK9RDmiAoLDpJ3U0lvlDOccNpY5M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uyXPUs7RczJ7NY461hprrAtMvRYA6p9v+RB9OZ2q6x9lFfac9uGykoIhXBIrFHKWO
	 kpTVyLdec0liLlOwMsJtO0bHwG52msxPIHLyMi05PAF30vQ14ylWnbGJMGOFxer/JP
	 mQe4YHS+mBQx+zUnkydhwGgsxEL/cPQkIh/SmMixsgoLQwYFK8Rhv0yFuykPu5qrum
	 kK8XMzYvP8fUNsdsQqxC0MzU/a7hu2SkDIeAXdw2fiB+yaqJdE42NHEm5oSKm/N0Gj
	 zAixehyCrS5fc23xd1YkvNgvU78SJM85oSv2YjEoujZ2Im0bOZS9c9M5jBxpoRgWKr
	 UOF+GHrFh9eEA==
Message-ID: <4c5a8c22-4e96-4780-a083-9326756a4144@kernel.org>
Date: Sat, 17 Jan 2026 18:50:04 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: apple: rtkit: Add function to poweroff
To: Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260117-apple-rtkit-poweroff-v1-1-6fbe8145e965@kernel.org>
 <20260117173819.GA55832@robin.jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260117173819.GA55832@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/17/26 18:38, Janne Grunau wrote:
> On Sat, Jan 17, 2026 at 06:24:44PM +0100, Sven Peter wrote:
>> Add a function to put a co-processor into the lowest possible power
>> state from which recovery usually isn't possible without a full SoC
>> reset. This is required for the USB4/Thunderbolt co-processors which
>> can be restarted since the entire USB4 root complex can be completely
>> reset independently of the rest of the SoC.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>   drivers/soc/apple/rtkit.c       | 17 +++++++++++++++++
>>   include/linux/soc/apple/rtkit.h |  7 +++++++
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
>> index b8d4da147d23f7e99e76eea314e4d976cddbd1c6..381faaf74d5982163d2c44d1e2c6e0ddad07bd73 100644
>> --- a/drivers/soc/apple/rtkit.c
>> +++ b/drivers/soc/apple/rtkit.c
>> @@ -851,6 +851,23 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
>>   }
>>   EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
>>   
>> +int apple_rtkit_poweroff(struct apple_rtkit *rtk)
>> +{
>> +	int ret;
>> +
>> +	ret = apple_rtkit_set_ap_power_state(rtk,
>> +					     APPLE_RTKIT_PWR_STATE_OFF);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = apple_rtkit_set_iop_power_state(rtk, APPLE_RTKIT_PWR_STATE_OFF);
> inconsistent line wrapping. It's wrapped for AP power state which is 1
> character shorter. I would wrap neither it only moves the statement 4
> places to the left.

Good catch, will fix it.
>
>> +	if (ret)
>> +		return ret;
>> +
>> +	return apple_rtkit_reinit(rtk);
>> +}
>> +EXPORT_SYMBOL_GPL(apple_rtkit_poweroff);
>> +
>>   int apple_rtkit_idle(struct apple_rtkit *rtk)
>>   {
>>   	int ret;
>> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
>> index 736f530180179bd144cf85eb0f0bd93844d7188a..bda3c528b51553c13f7fe5685ab60f7fc675361b 100644
>> --- a/include/linux/soc/apple/rtkit.h
>> +++ b/include/linux/soc/apple/rtkit.h
>> @@ -125,6 +125,13 @@ int apple_rtkit_wake(struct apple_rtkit *rtk);
>>    */
>>   int apple_rtkit_shutdown(struct apple_rtkit *rtk);
>>   
>> +/*
>> + * Put the co-processor into the lowest power state. Note that it usually
>> + * is not possible to recover from this state without a full SoC reset.
>> + */
>> +
>> +int apple_rtkit_poweroff(struct apple_rtkit *rtk);
>> +
>>   /*
>>    * Put the co-processor into idle mode
>>    */
>>
> Feel free to fix without sending a v2
>
> Reviewed-by: Janne Grunau <j@jannau.net>

Thanks! b4 makes sending that v2 very easy luckily :)


Thanks,

Sven


