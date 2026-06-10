Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6216405C47
	for <asahi@lists.linux.dev>; Wed, 10 Jun 2026 11:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090155; cv=none; b=ZF0VHCedWc0Iz/q/ELgV/rjhxEVEgUcD10YyD/7XaIMSnhOWwrkiu8ZMGk0GpIIusx1cdhFSFp5zgCy+3FHRWlveFPmpdwwyEEBtVmpDTsvdy60mOhaO2JUpAwP3+FxUByK0d20YVqnNt87iSJft8LFBtRftQy1nDkEtZAB5SPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090155; c=relaxed/simple;
	bh=KWnTRg+mjczQPC1dW7dIXNyJPlDFUHTGB3Kh2mwFLDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCEyFM8IufUvBOIWhZywk3shYrwC/iesUeCjy2vZELTR3NXlEsND+7y11fyGdydzjh7ozaUt7/FSPM0aK6DLWOnpLJd6p3/OkZtELyeOGSJwI27YchwSDB80yZyJOKSpzKKtkuQdIDB4UoKwD8mDJTjzkVQMCEV7zXJxGDdNZVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqMsPnQO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqMsPnQO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf20f6be6bso52290415ad.3
        for <asahi@lists.linux.dev>; Wed, 10 Jun 2026 04:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781090149; x=1781694949; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWnTRg+mjczQPC1dW7dIXNyJPlDFUHTGB3Kh2mwFLDE=;
        b=kqMsPnQO0B6tvXbWIr+22loaPoXQLn1c0IBrmnUzF6uXUKmzLxn32Rsl53L/BFkSMg
         th3wdmh5Tx4X2gqrI8H06ihNGYhwDb/JEQ507umQCPLkmHV3Bm+t21/vzjAhzJSTyB0O
         YYoGnTK7i4UJpBgWWnepBT+Q/Ia7r8mXQBHtTvGGrArkkRD6LmnvAnCzvr+HevlBaS2W
         sahtu3PSMSXLeQDPpsN6e+Qb8kk2QtyfNepBFrS2Set3YH9i5bRHcof54j6/OHsPUeng
         1wNwZVfurTSuwJ4ALsFcTk6ljR3RRBQka/oMzK2Oz+OFxO6aKRVnGPlvpKAJjnqeduek
         dJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090149; x=1781694949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWnTRg+mjczQPC1dW7dIXNyJPlDFUHTGB3Kh2mwFLDE=;
        b=jidh3TAZYx+91zaUChIg2FdgBDHM5DYSCvLd8SZ+uC88HUnl6vtQ64qxb6g84wLQsL
         WupHdq6Lsw6LEwLh+U1fE46qmTMhVjkHf+kgIra6pYGw6ZMr/UYWqeqkHno2WB8cYww2
         oel6fBdXU3diDhge9dNO6QMWn6DROfgXrG/zTPiv902gDxzBRjqs4Fx4dkVKzLkh4Zk6
         sK38bOILIucDjNOt/3RcAK50fGtfHXQ7Tym5NhMW7hoE1ZuC3/Ya2EoUlHgsAI9ooU92
         EmXpyVAuuSocfvlpN19ysJx7YUNiiRc1Js7pDl/sFQUNUUiN/3QGIS3ruPR6GG/FAPSh
         VyBw==
X-Forwarded-Encrypted: i=1; AFNElJ9WfF8+BwSp9aMfW6kNbX9ct5DkkM8AMtRwA4U3gm1n99igu2BYlpgcDanKQZmk28Z0POj96A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/tLogpk37OOFTjSLwc23CKA7egwAmLgjJa34403gczCs722UL
	vxCm3As6eTB3I6OjBFiCzYb5mwx3g2owDT6V2V2fP2aK8BcNRzXh7MBt
X-Gm-Gg: Acq92OH9zhejDBuW4VxrfE4zvbZIvtA8bpGnw8mN0pQyoypPj+cuJxFL85jnj3bqk5f
	GvQiMQ6FludtKjISCDpYOfschpNIcMOfMxC31sfuwkd4lOGT8Aw5p57/P2ZtcImnpTOB5iqOCef
	108AhaNYm14ELFawPOoZJHtCkuS8QSk56DUG7p2WiEiWXstBNDGiL1DJsFzMlq4346lRDr8tWSx
	SVQ6cmlw1JxkHWD4xPXeEay9PqAy0Y3o60xImenDpOEfMXepT0IBO2PjcM9Aho971nkizAn3KEn
	tUq8IUPo88lKyqiVfp0/GbHvM3IYD0H0EbcnmgLlOZFZuVWuh8sLHCLO0Ja5Y6EuVgsU1og0HfJ
	hhUe10QDenXHU3O+UsLY7b2Nl/XAR4JADzBj083axqfyBHQyL9KqHnY9SLZK73dGKb+xw2ZsPIh
	RCsOqiMbPp+NABm0owl48ItL6DwV0MBopKpRdHYyagl10a2CjyzM5vkeRVCdRxng==
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr292674635ad.3.1781090149023;
        Wed, 10 Jun 2026 04:15:49 -0700 (PDT)
Received: from [192.168.1.116] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e234sm251459075ad.53.2026.06.10.04.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 04:15:48 -0700 (PDT)
Message-ID: <4bef16f2-ad9d-4417-ae12-484ffd7a87a9@gmail.com>
Date: Wed, 10 Jun 2026 19:15:45 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nvme-apple: Only limit admin queue tag space when
 with Linear SQ is present
To: Christoph Hellwig <hch@lst.de>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com>
 <20260606-prevent-tag-collision-t8015-v1-1-93ccf4eca550@gmail.com>
 <20260610051146.GA559@lst.de>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260610051146.GA559@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Christoph Hellwig 於 2026/6/10 下午1:11 寫道:
> On Sat, Jun 06, 2026 at 09:25:25PM +0800, Nick Chan wrote:
>> Apple NVMe controllers require tags of pending commands to not be shared
>> across admin and IO queues. However, on Apple A11 without linear SQ, it is
>> not possible for either queue to skip over some tags and must go from 0 to
>> the configured maximum before wrapping around.
>>
>> As a result, in order to prevent tag collision, dynamic tag reservation
>> while a command is in-flight becomes necessary. In this context, there is
>> no reason to limit the admin queue's tag space, as it is not helpful in
>> preventing tag collision.
> I'm not really into these Apple specific, but what does
> "dynamic tag reservation" mean here?

This version is based on an incorrect premise (v2 is correct and already applied)
so feel free to stop reading.

In this version, the incorrect premise is that it was not possible for either queue
to skip over tags and must go from 0 to the configured the maximum. 

Under this premise, the only way to prevent collision is to set a bitfield indicating
which tags are in use when submitting a command ("dynamic tag reservation").
If a tag is already found to be used when submitting a command, return
BLK_STS_RESOURCE so the caller retries later.

Best regards,
Nick Chan



>
