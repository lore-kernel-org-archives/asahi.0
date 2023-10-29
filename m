Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D44ECE
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="yxYn2ZCb"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 35A5C878E9;
	Sun, 29 Oct 2023 16:09:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592183;
	bh=aMjAojErgLTqZ1v7dOg1JMNGlKE7uuYEe5lg2s8CQGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yxYn2ZCb60Ie6K/WRus2X7njqFiel10cTntNwjMgBcIaEaDcYGdQQSvzkTGJjF0Cm
	 OKbIbMCwlWMw8jbNSfmKW6J2J+4hz3Y9lTb82HHFzZxN3VDELX4F6XxIoHkpAKSn3L
	 zCokrnq8qwxz2YEXcf/ZI3nx9stJFotjwhWWhR7w34p66Fa6p9AJXR7SnUaUtt7dYo
	 SebiFME1BZWrvIf0X2ZXjZ64nBUrTVBsGd4RMK0QHlznt6OtcpwAV9AQsx5iPPi6z8
	 lImMgG5vTEGanP9MM2HwyKGWweHdIAVWmyEuruaqV3NvodZQtxlLIYhTyLiLT2Ckp6
	 uyjKTsp8m4oYQ==
Message-ID: <c3cfba5e-46cb-4fec-8e0d-b8aa1b9c0098@denx.de>
Date: Sun, 29 Oct 2023 13:11:23 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] usb: storage: Implement 64-bit LBA support
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
 <20231029-usb-fixes-3-v1-4-0153210a7f55@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-3-v1-4-0153210a7f55@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 08:23, Hector Martin wrote:
> This makes things work properly on devices with >= 2 TiB
> capacity. If u-boot is built without CONFIG_SYS_64BIT_LBA,
> the capacity will be clamped at 2^32 - 1 sectors.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>   common/usb_storage.c | 132 ++++++++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 114 insertions(+), 18 deletions(-)
> 
> diff --git a/common/usb_storage.c b/common/usb_storage.c
> index 95507ffbce48..3035f2ee9868 100644
> --- a/common/usb_storage.c
> +++ b/common/usb_storage.c
> @@ -66,7 +66,7 @@
>   static const unsigned char us_direction[256/8] = {
>   	0x28, 0x81, 0x14, 0x14, 0x20, 0x01, 0x90, 0x77,
>   	0x0C, 0x20, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01,
> +	0x00, 0x01, 0x00, 0x40, 0x00, 0x01, 0x00, 0x01,

What changed here ?

>   	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
>   };
>   #define US_DIRECTION(x) ((us_direction[x>>3] >> (x & 7)) & 1)
> @@ -1073,6 +1073,27 @@ static int usb_read_capacity(struct scsi_cmd *srb, struct us_data *ss)
>   	return -1;
>   }

[...]

> +#ifdef CONFIG_SYS_64BIT_LBA

Could you try and use CONFIG_IS_ENABLED() ?

> +	if (capacity == 0x100000000) {
> +		if (usb_read_capacity64(pccb, ss) != 0) {
> +			puts("READ_CAP64 ERROR\n");
> +		} else {
> +			debug("Read Capacity 64 returns: 0x%08x, 0x%08x, 0x%08x\n",
> +			      cap[0], cap[1], cap[2]);
> +			capacity = be64_to_cpu(*(uint64_t *)cap) + 1;
> +			blksz = be32_to_cpu(cap[2]);
> +		}
> +	}
> +#else
> +	/*
> +	 * READ CAPACITY will return 0xffffffff when limited,
> +	 * which wraps to 0 with the +1 above
> +	 */
> +	if (!capacity) {
> +		puts("LBA exceeds 32 bits but 64-bit LBA is disabled.\n");
> +		capacity = ~0;
> +	}
>   #endif

