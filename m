Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B09523A1
	for <asahi@lists.linux.dev>; Tue, 28 Mar 2023 10:59:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id AF4AF42525;
	Tue, 28 Mar 2023 10:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1680001197; bh=bYRnt+B1HrLM+j3g0G+TRZe8Sjd7lg+MSpbUMbrpXSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=n5fujo4b0kHA1Dx1aPpAl4mMG+8ge5vFKc48ch58iM+pLmw/x2CWnPfWUz/aSoLpC
	 f1dE7lW56f8tMcjDKabvLqk6nmIyKEP9fomQLOaOaePzlLAxRSwp4sbPSyjoiqEY4f
	 TfRGLS+xv0bmXxcc+mH80fnn5AZXuh2z0A4DiLFgdgWRb5OxIC+XocWMfD2ynVGH4X
	 /ivBXIpDTncQLrdjVo75tfUH4BfLGrWpm8IxrJMDSV2NbocaOlMEd7jEMWHB0v7x9O
	 hcPHdVCNYmk6yMsgGKq2BpQscfMpx+yOs8/MZ/z9T/wiGoDcNAcXCHi0EUYxB0gAo2
	 ONSrHqa3GCaRA==
Message-ID: <80285a1a-f15d-1c21-b907-55e47a44d08e@marcan.st>
Date: Tue, 28 Mar 2023 19:59:53 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] soc: apple: rtkit: Crop syslog messages
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230224162159.46348-1-povik+lin@cutebit.org>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20230224162159.46348-1-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/02/2023 01.21, Martin Povišer wrote:
> Crop trailing whitespace, null, and newline characters in syslog
> messages received from coprocessors. Notably DCP sends its messages
> including a trailing newline, so prior to this change we would end up
> cluttering the kernel log by repeated newlines at the end of messages.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---
>  drivers/soc/apple/rtkit.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index 35ec35aa500d..639f5134d159 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -409,11 +409,17 @@ static void apple_rtkit_syslog_rx_init(struct apple_rtkit *rtk, u64 msg)
>  		rtk->syslog_n_entries, rtk->syslog_msg_size);
>  }
>  
> +static bool should_crop_syslog_char(char c)
> +{
> +	return c == '\n' || c == '\r' || c == ' ' || c == '\0';
> +}
> +
>  static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
>  {
>  	u8 idx = msg & 0xff;
>  	char log_context[24];
>  	size_t entry_size = 0x20 + rtk->syslog_msg_size;
> +	int msglen;
>  
>  	if (!rtk->syslog_msg_buffer) {
>  		dev_warn(
> @@ -446,7 +452,13 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
>  			   rtk->syslog_msg_size);
>  
>  	log_context[sizeof(log_context) - 1] = 0;
> -	rtk->syslog_msg_buffer[rtk->syslog_msg_size - 1] = 0;
> +
> +	msglen = rtk->syslog_msg_size - 1;
> +	while (msglen > 0 &&
> +		   should_crop_syslog_char(rtk->syslog_msg_buffer[msglen - 1]))
> +		msglen--;
> +
> +	rtk->syslog_msg_buffer[msglen] = 0;
>  	dev_info(rtk->dev, "RTKit: syslog message: %s: %s\n", log_context,
>  		 rtk->syslog_msg_buffer);
>  

Reviewed-by: Hector Martin <marcan@marcan.st>

Thanks, applied to asahi-soc/soc!

- Hector

