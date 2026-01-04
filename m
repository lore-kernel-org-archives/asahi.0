Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1993C38;
	Sun,  4 Jan 2026 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767539865; cv=none; b=EqqK3gAApv9opu6gUhuusJsusUJplJ2PfHZCG3DClFIyn8IoLT8qVJ9gBJspNLQ3imYjqgycn0xnwu1JrhEOaYHKhhe5mha+BMZZAGi4vfC1TqDG1zHyL0s6gGCTOaCUD42p8Vk+VIViaLxBHsaH15WQbJcxYx/49nFIyiwD6w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767539865; c=relaxed/simple;
	bh=ilHTz00/ydutL7TWuctBmXtIkpvVMhcUPkVSQeqTSzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7IISAeQyjs4ihR1xfXgTmWRCEfv0bneas319JbRycfjrgHauq1W+JlrQtoJoSE+HBLvq9rPl1pP5Fy5d35cdH4RpLGRHdD13w7QpfeWBq8lq9oThDVzMTa+bycHDic/5eSVkycxpNZu9GpmjRv3reBmVEbQF9nYBX7fKXSYyiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAUMOJ/e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAUMOJ/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0100C4CEF7;
	Sun,  4 Jan 2026 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767539864;
	bh=ilHTz00/ydutL7TWuctBmXtIkpvVMhcUPkVSQeqTSzc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nAUMOJ/eyXqjteFZhyToWEkWmGfYyugqGNZjnrNBCBEwQh6JjcUY6RQoLg5KBADu3
	 sEMqzu7Egr7Ks03o8HMpZNgNwLCbOJlY+Ec3KMA3dEwvgbxgomFHym73MquX6QYnfT
	 I0ktuPK4t0uw//2sNtOmsLhu6d8tfVIlnFE/uhEGXWIcHAR6PUKqfakJh4NchyNdcZ
	 Hw2l+JQ+kKC+tKnwSgbtuIL8PXBOQnwkwtKXsch6xNEq9P0mGvoIYvtsn+7/VD3+in
	 JnnquiiNzYCOwP9jpYxQsejqg/HmIggV9SrWYs87i6Wea6xf6OEt/bQIjPlsRCn1uo
	 A0lLSJUTdNJQg==
Message-ID: <04da9bc6-ebfb-4799-bace-c56a9537282e@kernel.org>
Date: Sun, 4 Jan 2026 16:17:40 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: apple: rtkit: Support verison-specific app
 endpoint start
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
References: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
 <20251223-rtkit-v10-v1-1-12b4783d6403@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20251223-rtkit-v10-v1-1-12b4783d6403@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


On 23.12.25 15:13, Nick Chan wrote:
> Support for protocol versions where app endpoints starts at a
> different endpoint number will be added. Consumer drivers will also
> need to be modified to have them to work with such protocol
> versions.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>   drivers/soc/apple/rtkit-internal.h |  3 ++-
>   drivers/soc/apple/rtkit.c          | 42 +++++++++++++++++++++++++++-----------
>   include/linux/soc/apple/rtkit.h    | 10 +++++++++
>   3 files changed, 42 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soc/apple/rtkit-internal.h b/drivers/soc/apple/rtkit-internal.h
> index b8d5244678f0100b72173fa9aca80bf9db1b4e5e..52ef7a202120eb8a56c149179389741ec0f5e358 100644
> --- a/drivers/soc/apple/rtkit-internal.h
> +++ b/drivers/soc/apple/rtkit-internal.h

[...]

>   
> +	/*
> +	 * The management endpoint is required to receive the HELLO message
> +	 * and infer the start of app endpoints so assume it is a system
> +	 * endpoint here and update this value when HELLO is received.
> +	 */
> +	rtk->app_ep_start = APPLE_RTKIT_EP_CRASHLOG;

The comment doesn't explain why you set this to APPLE_RTKIT_EP_CRASHLOG.


> +
>   	init_completion(&rtk->epmap_completion);
>   	init_completion(&rtk->iop_pwr_ack_completion);
>   	init_completion(&rtk->ap_pwr_ack_completion);
> @@ -851,6 +860,15 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
>   }
>   EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
>   
> +u8 apple_rtkit_app_ep_to_ep(struct apple_rtkit *rtk, u8 app_ep)
> +{
> +	if (!apple_rtkit_is_running(rtk))
> +		return 0;

Please don't just silently ignore errors.

> +
> +	return rtk->app_ep_start + app_ep;
> +}
> +EXPORT_SYMBOL_GPL(apple_rtkit_app_ep_to_ep);
> +
>   int apple_rtkit_idle(struct apple_rtkit *rtk)
>   {
>   	int ret;
> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
> index 736f530180179bd144cf85eb0f0bd93844d7188a..423cf1022372b124c9b2728445f85a9b3067c707 100644
> --- a/include/linux/soc/apple/rtkit.h
> +++ b/include/linux/soc/apple/rtkit.h
> @@ -172,4 +172,14 @@ int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
>    */
>   int apple_rtkit_poll(struct apple_rtkit *rtk);
>   
> +/*
> + * Convert an endpoint number relative to start of app endpoint to an absolute
> + * endpoint number.


Is this conversion even true for other co-processors that are not SMC or 
does it just work by accident here? Maybe it makes more sense to drop 
this function and decide which endpoint to use in the SMC driver.

The documentation is also a bit confusing, please at least explain what 
"start of app endpoint" means and where/how you would use this function.





Sven

