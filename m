Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6EC18C90F
	for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929778; cv=none; b=EQ500U8WoSt3F53JrWZCx44aqQazcZvBeqhJhn09DyZMxY3Tyv2Or02ajnH14rOrnDBhZJrVildb+dXbS3NlzCHPyfz7rDbdWmIb1gNvtTcaa0b8SGivXAjaFTdk7QbTToLJQPaU1BZkGDzL4RsMHu5rJyZNMZLAO0vcP4R4nZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929778; c=relaxed/simple;
	bh=sG/raVnx3HC8/TEH4IPZw5S6fzpcJ+CAyoGc5BaqYns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlOLqg3OUL6z1SYB6dST7YHL2rvn9btYtTeLQHVvz2tDvcZXlsBOQS++FlGj3xOpxgVbyVsWHRWkzHdGTJF6HKifGyG3eghAzbdyMfwuDggtVPPtJNnZEljg0bqly9758QIIlLybynWWuLciTGw9JDlsdIe1wugAeT05NgchcJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CajAYH07; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CajAYH07"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20202df1c2fso11571915ad.1
        for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724929776; x=1725534576; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=peUvJHmZvKj9l0DgThdraUA2U1lKp1rDQkc/x5wUhK4=;
        b=CajAYH0711btyUlQIdlEinPNGR66wBD2XUDpIJm3AlalEGkpsLbjMIbCUJLM2hrzDG
         DGDPZZGmMHFnA70OQQxDczzQ+5dohftuapcgFxFzLCUoUN41XparuooQmp0Faq2HDSqy
         njtJF2WlPD4ZYC/ITw6vkg6I4buEUKut1MRYeU+j6Lg4vPtElLBGfKDXmCASXOWwno3K
         vcb26VS/II89DQ08zh+SMlquZOR5CBas2AapGUdJm5PPzAnFKJ7WAMxBK+iivqdZv/2U
         uTGdJICOiuRlYspYDqN1ss/Di9kXxyfR0/u+lAsLvfY3KRqwxdMvcyjoOQrHYuGzUBGt
         yo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929776; x=1725534576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peUvJHmZvKj9l0DgThdraUA2U1lKp1rDQkc/x5wUhK4=;
        b=Tyb3hHuSJkGgta0vAUp3e3bbh1go4Jl0bNc0LFZmZyKw2lYadPTUdUMzEwx52fof7S
         Z+S9Q2mY1NBppp9m4WnWkdOr3pg5K2on+UGV0z23DhBNAsDVM4aRwB2EDoW21gsF7sox
         4pkSee8wz3/VqoeU+COfQpyTB2J6H6GF1tDiB34t+G2VVV/6ODdsbMP6tI+Q+KymOG7p
         7/DvTketszvbxhscvTp9bHJx9jeAsUb8BIBKhdAiPkR/G85RrkFSHKANFHwS7gEOyXEB
         RAgSgXbckIRZLodbZwrDUD1sOqdDYjDCPyjBHpAH8l1/uU6vZsEftBFT9vPe/wpK0E4H
         tegA==
X-Forwarded-Encrypted: i=1; AJvYcCW2WZD9eb7dDf41tO7Zt02qUoCJIe7m57QICzpPj84hXhBDhXkf64bywHYgqk5XUTALAlHcbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNzKmmq3gzeAa13P428bNQR+KfO417g7lF5xv+Do4XQCpIQyHP
	f/fErxVsxasLVzwxPeznHNlpEP0Udoj4vU9L8Lii4JJxycsnWUKD
X-Google-Smtp-Source: AGHT+IGdEOcfdKj0mrRNzvZvFSj5VjQPh/SiyTbiJB6q+bMK1A3fHVFUxokQUSRAMYhQuzez3pc/sw==
X-Received: by 2002:a17:90b:1095:b0:2c8:f3b5:7dd1 with SMTP id 98e67ed59e1d1-2d85c7a02b6mr1804373a91.16.1724929775836;
        Thu, 29 Aug 2024 04:09:35 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445e80absm3787855a91.13.2024.08.29.04.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 04:09:35 -0700 (PDT)
Message-ID: <afd79f6c-89b4-4229-aa16-f130a35d78b0@gmail.com>
Date: Thu, 29 Aug 2024 19:09:31 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: apple,aic: Document A7-A11 compatibles
Content-Language: en-MW
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Sven Peter <sven@svenpeter.dev>, Thomas Gleixner <tglx@linutronix.de>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev
References: <20240829092610.89731-1-towinchenmi@gmail.com>
 <20240829092610.89731-2-towinchenmi@gmail.com>
 <172492705116.3333643.6993934329983052782.robh@kernel.org>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <172492705116.3333643.6993934329983052782.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/8/2024 18:24, Rob Herring (Arm) wrote:
> 
> On Thu, 29 Aug 2024 17:03:11 +0800, Nick Chan wrote:
>> Document the compatibles for Apple A7-A11 SoCs.
>>
>> There are three feature levels:
>> - A7-A10: No fast IPI
>> - A11: fast IPI, global only
>> - M1: fast IPI with local and global support
>>
>> Each feature level is an extension of the previous. For example, M1 will
>> also work with the A7 feature level.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  .../bindings/interrupt-controller/apple,aic.yaml  | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/apple,aic.example.dtb: interrupt-controller@23b100000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['apple,t8103-aic', 'apple,aic'] is too long
> 	['apple,t8103-aic', 'apple,aic'] is too short
> 	'apple,s5l8960x-aic' was expected
> 	'apple,t8103-aic' is not one of ['apple,s8000-aic', 'apple,t7000-aic', 'apple,t8010-aic']
> 	'apple,t8015-aic' was expected
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller/apple,aic.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240829092610.89731-2-towinchenmi@gmail.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
Acked. yamllint was not installed on my system.

> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Nick Chan
