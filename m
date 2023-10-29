Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28ED33C7
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="SLv9uXPb"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 7302842657;
	Sun, 29 Oct 2023 15:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698594879; bh=LAskF4i5QRmzufWCZhEAhYTeHUconibVvsURkYNwOXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SLv9uXPbtfFC9Hlueh/OswbwrPNRfjlGKsjQ6fARz5dbl8lcsKKEAL+2fpApU50Eo
	 IWmbhXgo7KXKvFAUdhXKkJHKlzBwaB0grnH5lIkqsCwH7jj8DAp8SxB5D+2RqYJrOc
	 APYhtZD+mz49u+pd5ic9e0PUqbnhT7Pb4ShUJdrjyVIAEwMIASN8uIdIvkvwmjC2ke
	 pa9frlXEsbD7OrxWlG4OX/e0KISibzO6BDZnAQzDtR4xkSULXznT1v1kalMOMJEJki
	 mGXXFQoGEE5LG1Y8koVGdFHBSLSnPft62z3MqYOE5o8ZKJSrYMSDMfGALrbj8pvjP1
	 4LD2vgGd0s+OA==
Message-ID: <1db9cfab-4e89-2308-e398-8ea283079314@marcan.st>
Date: Mon, 30 Oct 2023 00:54:35 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/4] usb: storage: Implement 64-bit LBA support
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
 <20231029-usb-fixes-3-v1-4-0153210a7f55@marcan.st>
 <c3cfba5e-46cb-4fec-8e0d-b8aa1b9c0098@denx.de>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <c3cfba5e-46cb-4fec-8e0d-b8aa1b9c0098@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2023 21.11, Marek Vasut wrote:
> On 10/29/23 08:23, Hector Martin wrote:
>> This makes things work properly on devices with >= 2 TiB
>> capacity. If u-boot is built without CONFIG_SYS_64BIT_LBA,
>> the capacity will be clamped at 2^32 - 1 sectors.
>>
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> ---
>>   common/usb_storage.c | 132 ++++++++++++++++++++++++++++++++++++++++++++-------
>>   1 file changed, 114 insertions(+), 18 deletions(-)
>>
>> diff --git a/common/usb_storage.c b/common/usb_storage.c
>> index 95507ffbce48..3035f2ee9868 100644
>> --- a/common/usb_storage.c
>> +++ b/common/usb_storage.c
>> @@ -66,7 +66,7 @@
>>   static const unsigned char us_direction[256/8] = {
>>   	0x28, 0x81, 0x14, 0x14, 0x20, 0x01, 0x90, 0x77,
>>   	0x0C, 0x20, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,
>> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01,
>> +	0x00, 0x01, 0x00, 0x40, 0x00, 0x01, 0x00, 0x01,
> 
> What changed here ?

This is an incomplete bitmap specifying the data transfer direction for
every possible SCSI command ID. I'm adding the new commands I'm now using.

> 
>>   	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
>>   };
>>   #define US_DIRECTION(x) ((us_direction[x>>3] >> (x & 7)) & 1)
>> @@ -1073,6 +1073,27 @@ static int usb_read_capacity(struct scsi_cmd *srb, struct us_data *ss)
>>   	return -1;
>>   }
> 
> [...]
> 
>> +#ifdef CONFIG_SYS_64BIT_LBA
> 
> Could you try and use CONFIG_IS_ENABLED() ?

Sure.

> 
>> +	if (capacity == 0x100000000) {
>> +		if (usb_read_capacity64(pccb, ss) != 0) {
>> +			puts("READ_CAP64 ERROR\n");
>> +		} else {
>> +			debug("Read Capacity 64 returns: 0x%08x, 0x%08x, 0x%08x\n",
>> +			      cap[0], cap[1], cap[2]);
>> +			capacity = be64_to_cpu(*(uint64_t *)cap) + 1;
>> +			blksz = be32_to_cpu(cap[2]);
>> +		}
>> +	}
>> +#else
>> +	/*
>> +	 * READ CAPACITY will return 0xffffffff when limited,
>> +	 * which wraps to 0 with the +1 above
>> +	 */
>> +	if (!capacity) {
>> +		puts("LBA exceeds 32 bits but 64-bit LBA is disabled.\n");
>> +		capacity = ~0;
>> +	}
>>   #endif
> 
> 

- Hector

