Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5CA8F74
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="Z8e1GrkD"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id E963D42657;
	Sun, 29 Oct 2023 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698594656; bh=2YhKpk0XXGrTL1dF8wAICueOpG1GTdA+b5mLJ+YDH3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Z8e1GrkDAshhNA0VyiRe1XrK8JScBDTJP9n8dE+oINnkxR+FPipA5qCt/rCvHiM5G
	 g2v3/za31P41cU4dr5HeOIpB1ljKEi8+Fbqk6xeIzyH4lzfDwU/M5QUBohdtBkWa8n
	 jDlWCDMCC9tQM+BeFKCylnP9V/Vy4umV/xZl6vU0sPt2iQLEpg2Tgw27Wfpve3HOOA
	 2TLdVKjG5eWPPQuUlm7dRqn4+HreQOA5sAKFILpAylmAkyDfPtyDncVaDFI0+zc0ZG
	 xWX6WvZE0NLaRroyi0IIXt3V2WFDA5p0KBNbr96x1zbxINJ+M/CP2UJ5E2vUjfMxKE
	 sX888Hz6JM1oQ==
Message-ID: <c3f6d8de-dff7-f0e1-4c87-9eb56e0c6eb8@marcan.st>
Date: Mon, 30 Oct 2023 00:50:51 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: Ignore endpoints in non-zero altsettings
To: Marek Vasut <marex@denx.de>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-4-v1-1-fe973dde7e59@marcan.st>
 <2a2c6186-5854-4bbb-ad12-d8b2062a7a63@denx.de>
Content-Language: en-US
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <2a2c6186-5854-4bbb-ad12-d8b2062a7a63@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2023 21.04, Marek Vasut wrote:
> On 10/29/23 08:24, Hector Martin wrote:
>> We currently do not really handle altsettings properly, and no driver
>> uses them. Ignore the respective endpoint descriptors for secondary
>> altsettings, to avoid creating duplicate endpoint records in the
>> interface.
>>
>> This will have to be revisited if/when we have a driver that needs
>> altsettings to work properly.
>>
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> ---
>>   common/usb.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/common/usb.c b/common/usb.c
>> index aad13fd9c557..90f72fda00bc 100644
>> --- a/common/usb.c
>> +++ b/common/usb.c
>> @@ -463,6 +463,15 @@ static int usb_parse_config(struct usb_device *dev,
>>   				puts("Endpoint descriptor out of order!\n");
>>   				break;
>>   			}
>> +			if (if_desc->num_altsetting > 1) {
>> +				/*
>> +				 * Ignore altsettings, which can trigger duplicate
>> +				 * endpoint errors below. Revisit this when some
>> +				 * driver actually needs altsettings with differing
>> +				 * endpoint setups.
>> +				 */
> 
> How do you trigger this error ?
> 

Plug in a device with altsettings, like most sound cards or UVC devices.

- Hector

