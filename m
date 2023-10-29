Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD84ECE
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="gCp8dbcN"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 08A868755E;
	Sun, 29 Oct 2023 16:09:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592181;
	bh=BGvQGU0NzwHNMhWkxhrsAQSQmXC6t7ZL2W3ZktR2SoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gCp8dbcNv/1DgfcS8+YUmKUtFzLHO6HMFZKPP3MKn5/E1h2Dz8VHRHjbO/U1ZMhsw
	 FVyE7FbyISMtGiNUjwxHxIR/9WC+CNq5fjdaSm541W0C8pgxayM1zjUDfV5ex8HaQT
	 BbJfP0w1Q5W0SXppdj7b4eB+R7h6y/+rARp/213JIFfTT7/DuFwx7yxsqQwPtC0i8C
	 3xv37sKnJdrD4o1sS+qlS85rY8bjDuPsjhQNVGT80qKoS71GiP4CP15TJP7UG7a02J
	 +DsiOFxVSYuuCcMQz22PyS/exbyY1MpkZsJA4oSD7oQo0zNGauttENrNneBaHw9Nc1
	 GL0pd7YMkOrdg==
Message-ID: <2a2c6186-5854-4bbb-ad12-d8b2062a7a63@denx.de>
Date: Sun, 29 Oct 2023 13:04:47 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: Ignore endpoints in non-zero altsettings
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-4-v1-1-fe973dde7e59@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-4-v1-1-fe973dde7e59@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 08:24, Hector Martin wrote:
> We currently do not really handle altsettings properly, and no driver
> uses them. Ignore the respective endpoint descriptors for secondary
> altsettings, to avoid creating duplicate endpoint records in the
> interface.
> 
> This will have to be revisited if/when we have a driver that needs
> altsettings to work properly.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>   common/usb.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/common/usb.c b/common/usb.c
> index aad13fd9c557..90f72fda00bc 100644
> --- a/common/usb.c
> +++ b/common/usb.c
> @@ -463,6 +463,15 @@ static int usb_parse_config(struct usb_device *dev,
>   				puts("Endpoint descriptor out of order!\n");
>   				break;
>   			}
> +			if (if_desc->num_altsetting > 1) {
> +				/*
> +				 * Ignore altsettings, which can trigger duplicate
> +				 * endpoint errors below. Revisit this when some
> +				 * driver actually needs altsettings with differing
> +				 * endpoint setups.
> +				 */

How do you trigger this error ?
