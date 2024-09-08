Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C08E134AC
	for <asahi@lists.linux.dev>; Sun,  8 Sep 2024 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725810556; cv=none; b=MoipQt2CwRjoSUUqgQVm1pyKSh8muhhsEoaSfwUQErmFW4djSBkC4RvfG8c4NiCDcoWRo89rB18N4H5jMYaMWCqBYuy4AeaLpzGXuXnkIYzcD4ZWclgCConyV6iwcNfUCt6ZHFtlwRkcoMIhsclkR4o2FjlyCcpEWYUlJyPJAho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725810556; c=relaxed/simple;
	bh=Ej/MFl0U2grPzl6++vWZajsco3EirVz0KDFILRpbV9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWBWwFysmoJdD6gZgLxpsuwdePO2juI5QJR3i5mTnKe261K745U6k5+ssgkZuWBlDGnmiDOLcvrAjqQFZfaxKt67z+VIwLzdFngJyOY2K5FLsVTjluIajPTWSJsguZuaQWh15dUrn/Q4SauB2Yagl013EMd/sIxmXRIVTs+FKiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnKZPbx+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnKZPbx+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-718f28f77f4so438822b3a.1
        for <asahi@lists.linux.dev>; Sun, 08 Sep 2024 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725810554; x=1726415354; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAgWa81lHt3+8vspOTElzUpWSVFWjeBPjKGz1uM25hg=;
        b=JnKZPbx+SuMUvtjHkzKNkQ54bQ9khMxFamN0TccRQY2PyKWjxhK8O0dx0FU3X6XptO
         OzWJ/C+OXe0MUtsmxupITuCBRhuXXjdBnhD5ytOM35HUZiW8NWc8VzR4jiCH8SjRo8IS
         fwVj92K+BtNrC4bnVSZ40CCkCZnLng2iThOCNT7aAd/vISklOAX/1qugMxXwkcjfAzJx
         sWtvieDR7Q31p21u3tvAIGmTDrTld0+DAAuz8MF+pLSB5Pdv4z+dn9ZQSNCCOvv+I39h
         Ay3YmZaE4W0ydBlkyugkPb2yxDPi2rLU8klMZKxPdRhpp63XyJl7ybZdPqojMvhSym5r
         pACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725810554; x=1726415354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAgWa81lHt3+8vspOTElzUpWSVFWjeBPjKGz1uM25hg=;
        b=fm+usXRIBZXTdLhcnZ0CkC5B3DkAFnNeHAgshYokDqSuPmNx7vsdHmC3yQ4d5AMegV
         ArOUqGV8nrnvRGY9Rahg/hOWtxcqkExievoQhirKtrJkLWUICErbs4nuwvPweWytiD4W
         6zFVmLdI1OjeguxJl5H7bNcen8Yi9vp/gF9qo6/P+dgleYwWQnW2dfq6Mxyna+5sxkt6
         PT0jZzJU+tQZZwZUE9B7D7e/8SifZFCu6TQ/CbaSV45iUwbqUeDkGWTwVw3ARkOEaNLL
         PmsD5l5e5tNTiAxuJ+MhIvyWCDu3zdyn3DboOL0JoZ2Jaxur4UsN8s4OME047Od9kAN9
         /5SQ==
X-Gm-Message-State: AOJu0Yz729PuvVQJYznjHnJRaZMolPiMkTFmBNy9abrEs2I28OVpSTYY
	OtO7rQnx2Dkw1SC1+TotQHAUyXazwwI3mQpPZrGQ8w2NIyYVJZ7J
X-Google-Smtp-Source: AGHT+IFFrn46ubbqFuvUo4a8LlVSDErVxtVEIX8+YBhSiGmjRd6iFtQgAdWXG9qXP5Fm0bTGW9ZC8Q==
X-Received: by 2002:a05:6a00:21cb:b0:717:8aaf:43be with SMTP id d2e1a72fcca58-718e3108dcamr8126650b3a.0.1725810553973;
        Sun, 08 Sep 2024 08:49:13 -0700 (PDT)
Received: from [172.20.10.2] ([49.130.9.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e599135csm2162442b3a.193.2024.09.08.08.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Sep 2024 08:49:13 -0700 (PDT)
Message-ID: <13a98caf-80f0-477d-b276-249e3fb20e83@gmail.com>
Date: Sun, 8 Sep 2024 23:49:09 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] tty: serial: samsung: Fix serial rx on Apple A7-A9
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: asahi@lists.linux.dev
References: <20240908090939.2745-1-towinchenmi@gmail.com>
 <20240908090939.2745-4-towinchenmi@gmail.com>
 <215fde01-0e04-4445-9620-b0dba3232a92@kernel.org>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <215fde01-0e04-4445-9620-b0dba3232a92@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/9/2024 17:14, Krzysztof Kozlowski wrote:
> On 08/09/2024 11:05, Nick Chan wrote:
>> Apple's older A7-A9 SoCs seems to use bit 3 in UTRSTAT as RXTO, which is
>> enabled by bit 11 in UCON.
>>
>> Access these bits in addition to the original RXTO and RXTO enable bits,
>> to allow serial rx to function on A7-A9 SoCs. This change does not
>> appear to affect the A10 SoC and up.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> This never happened. Please do not add fake tags.
Sorry, this happened by mistake, and tags are added to both commits present
in previous versions by accident. I can send a v4 tomorrow, though I think
it is the best if this version is to be reviewed, since the mistake does
not make a difference in the patch submitted further upstream, and it saves
everyone's time.

> 
> Best regards,
> Krzysztof
> 

Nick Chan
