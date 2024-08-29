Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C6A18C916
	for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724932825; cv=none; b=rghlK8ODETMgCLbnvHv4zBBK7jtQS1+u3BttSQeWDrJTfBSLOUkki6Wrsfq1ZGALnyfl37xBPlTxLUkm3egz/cvzD+W03+F/qCkCizKFGAbmuwM8Cn6ZbwSJyfdz0j+0sjd686uGM0CJRRfbeedtzmAhnLfF82FAn/TomahyVDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724932825; c=relaxed/simple;
	bh=+AFMsTioAXTYe+/OIC8TW55UGMedcr0nSW9NuwvwmP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrdV6Si/fGHSCBzlRdpLFFtT8MqK3NN63HVHVYJPxc0d/UkRvQj7w70daWsxK4IvUcsGkWi6LwtbY5NG0ORaP7QDO9YVaCjWle92Pt7igTwIeLvCs7Tg191LuGbuc2VYzbEk4s7A9z+NfwKFn5ZBE6zJrun2IcLg96cs/7WAxYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PczlDiHz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PczlDiHz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-201fba05363so4898875ad.3
        for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 05:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724932823; x=1725537623; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27LAEgYBljGGhgNMpBJC2vTKDP+IyCsrvFLq2dI8Abg=;
        b=PczlDiHzcZL044+NOF5H4N2KaPFx4JU2R9111kxeiHNRyNiRCDQJnRgQm7TtfeIoky
         N0q3vibt4CPziga9G9qR3JH/MqPoaERn+vMn+n5oq+dFQbI0caRcKVYb4qFVUeHdsx8E
         rwhe9c3DDaHKctxT91WsH335qG3aoQUp6hXS5fFHmh4AoH4VTT310lS1yrev79+jUUue
         WXChO9q7Bm69wilo9uZ+nJl/rsjY6V7KvbXyeijqLMYAY6df6noO3tNwgWw52jLlbY+G
         MwnrLU82IXw1xM7afAD+Ta4nZ3hLlv/u4F7vP6/XMchy1y4hpHH2dK8pyyNTRgykFN1c
         lRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932823; x=1725537623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27LAEgYBljGGhgNMpBJC2vTKDP+IyCsrvFLq2dI8Abg=;
        b=rXms7k9fTKevUKVxtGSLQD7+KKvhIQGzyvs0ionbpqfgKqC4Ci+hleY5lCWCtiPDuJ
         dYboadCKGyaFJnsv2DrMAjYbxBdahulU5YUt6SpMThc71mNxlXwDtX4kSrVrqn01HV+O
         +pA+/IviLjZCQD9ZmZSWAVcvBG6TYW8RbQR1CqEkHucvT+/fXeNmCynLsu8leX1f3d2b
         Bla/zKGWiN+dndyQvvJ/AGWivkjp+OMBMQItWU5hF1ohQIITDvV4Iw0JDq3WlUlvpEc1
         oZxtfXyt1cMCFH1tN0Z9/cLMS5p4BDd/dU6pxfYAWFMXJTMxBI3p0X8nvkXM6DKmEP2e
         O22w==
X-Forwarded-Encrypted: i=1; AJvYcCVsTFfqqZavc7UUNIoCAcQvPp/1Ds4NmttSMwvI44rF1nfb8rCeXRq9MOyEo8NwG1dxqXG5Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwApq32uzyfdf3ZxnnVJUjR+tsL9eQEPrKT3hrw/SVfm8vtn+wR
	3F06wdmslz7ORRWx1KNjTrleLU58fzFHXqcEaXCsVp+LUYC1CwYI
X-Google-Smtp-Source: AGHT+IGSxZrGNk+/VLxv5dcGRLbTumgaEh9jEg3/DzzAzQRgXV7JusDx9MISGEMfgtbvbhJA7p08PQ==
X-Received: by 2002:a17:902:d48a:b0:204:f324:e7a8 with SMTP id d9443c01a7336-2050c2186bdmr27634425ad.6.1724932822870;
        Thu, 29 Aug 2024 05:00:22 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1326sm9998545ad.35.2024.08.29.05.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 05:00:20 -0700 (PDT)
Message-ID: <8fb7bce8-e1bc-4ca8-8033-811ed67cc767@gmail.com>
Date: Thu, 29 Aug 2024 20:00:16 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/3] dt-bindings: apple,aic: Document A7-A11
 compatibles
Content-Language: en-MW
To: Krzysztof Kozlowski <krzk@kernel.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht
References: <20240829110436.46052-1-towinchenmi@gmail.com>
 <20240829110436.46052-2-towinchenmi@gmail.com>
 <220766f0-7cbb-4b4c-a976-477ca1d89fee@kernel.org>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <220766f0-7cbb-4b4c-a976-477ca1d89fee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/8/2024 19:46, Krzysztof Kozlowski wrote:
> Please do not resend different patch. Or rather explain - is this the
> same? Looks different, so RESEND is not appropriate.
> 
> Follow submitting patches in this regard, you need v2. Just use b4 for
> this process.
Right. Since versions of patch series should not be sent too frequently,
I suppose a v2 should be sent next week. (Sorry - not super familiar
with the process)

>
> Best regards,

Nick Chan
