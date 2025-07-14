Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3306C265CB2
	for <asahi@lists.linux.dev>; Mon, 14 Jul 2025 15:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752507475; cv=none; b=aWxiPwgn1Ja3EJP+dtcdvq1NRH0dRg/GJXxaNBYWAAgREzXckxIE9CXptQvo1EW2S4Fju2nO8anSi9TMI7EG793X519Pgq81Qnh8P3aIBidmam5m1MTp2hJjwKRpsasiK6QytnWXLMqUmOqYEyyFzhXKn2K5eO9qOSbNn8T3uWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752507475; c=relaxed/simple;
	bh=QjQ0UWlscOYrLTxqfo8jeI2W2cZqq+DP0CdXTDyGEcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0h8mrEZOGTLmkviyWOdReZfHlpUNPM3MA12uiuQYd3kcLD+kJVu2I5MV6W6ul9dByoyR5gQhos7i7iPWlGp/PTR2ftaTYp0o+4VH5w9ewLPIYy836FaZW+OBed/KiZnMK270wI0ow/WPBrlaxeQPxRl8qMwgWCGuX8ke+A/h1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHyLv5mm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHyLv5mm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235d6de331fso49000065ad.3
        for <asahi@lists.linux.dev>; Mon, 14 Jul 2025 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752507473; x=1753112273; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QjQ0UWlscOYrLTxqfo8jeI2W2cZqq+DP0CdXTDyGEcE=;
        b=OHyLv5mmpDatJImWzVcTIJH//tyy8x8JBdG88Ud0yqbIbt3vT1FufIYTwAKULn0PKe
         57u7fMBuI8OeK2ZUfPbD75/zgY2lMbyR++uYPiaLCVYZDgUY2VnbhSSDLABx8G2Q0AUE
         agWTHJulTefXWOPtBL2Uic1+7viy9tsiwKNacV2KWoUrwiDr7gd3gTdOtYATYJNl0gvI
         twXhmlDIHrIYw7uLrAN6xva9KbNWFWKM4HDR8HOi750S3rq9c8Vx+T4v+7MAP/1yTYV0
         09WHTx+ILn5Qpk8ZASslnR1BAXOwq3JV25AZ20wTQPGOPXyVqKTYaQ6YQqny2+qehBvG
         W7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752507473; x=1753112273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjQ0UWlscOYrLTxqfo8jeI2W2cZqq+DP0CdXTDyGEcE=;
        b=ZjKxog+6xCqja7iD0JdtFlSST1AS1CJ8XLMRj6bMlqj0wB9jIB4B+Eeae7zfaPlROa
         49jrlyETO2DqO/rdU9DHxedJDsF3Jz59QyG9CfCOstrZVfOeG4dw8V1n5SKtt6ZxTj+S
         sSOO71B54HMp3W8GREiErQo5QYg6dAWKJ8TLFk7cjk35QYvnUk+WsxFS5Rgf6siqKwpO
         DV/VVqFsdWc2HHPlaX3r6G2xfPCdNOqXlxSKvsmUtXYyE4x3Rjji2AljdrYO1ENB2yem
         dCjBKsYQbWZG7zWSHPO4ATLLMswNMqlN6skEPhfP4UCOmI1fVh0IYuT7zeH0pVNpMmgg
         aVKg==
X-Forwarded-Encrypted: i=1; AJvYcCWPS183Zi65O/xKjKzwo4fWmIv432jHVa25N12ZfZQaNfA3bCvQibLZpz9jfPBiHcKBByqqpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPk1LPS+ZqzHK86l3BE4GyXiZ2UkhYieAJO6MQzHHr0N/vrbAQ
	7LJ3x7NvOmTFjJtCKZpHl9Z2XYJlTKaleYojcnaa3xEzcOxjFZyQ8g/1
X-Gm-Gg: ASbGncstRKXTr88bF7fgdIA6cRVEL60hFBJ147g4JBjbNaJwypMbNEyly/r6DlC/Dfc
	IAVCVQ3Un6wq+zX52tie5CCyZbV/VG5bmbl1vkmcUG9AUQt1etxkz/Z1VFrhlp1syxbvJuIkJwf
	7MX4VOtPRMfh/dvJZx0dPrHq8x7z+SAA+gTYNRr6IPwxuent+zRqF/7dd6ZUfhJ5U0FKxqo52Q7
	AiSpOhIFAN0ELC6NGkd5CWRdTIVFFYXiAcJ77mmMzC+DALcFi3SQM3TbwMaZA+n1Mc8hfWBSqir
	+bwu9Ig1PZ5KJfOnWrwcvh1ZOsNl4n+LMvlOX8qAtBPAv3TxrN6hYmIJwgpb+MF+nS5jEyYqcm+
	LM2vkaits8oF4v0FI+/LxQ2AsSw9a2wJh93bHjscbpLZvJWUMA2ThMCNVLqqw45s=
X-Google-Smtp-Source: AGHT+IEMvnX379Cfqxjm8d/1Z5fQyV4o83jOtFXuWtyBzvMeYslcOx4WAebdY0n5WCMLCRYgzq0u0g==
X-Received: by 2002:a17:903:a4f:b0:235:f70:fd39 with SMTP id d9443c01a7336-23dede2e17cmr167967685ad.10.1752507472927;
        Mon, 14 Jul 2025 08:37:52 -0700 (PDT)
Received: from [192.168.0.124] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ae9f5sm95068015ad.66.2025.07.14.08.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:37:52 -0700 (PDT)
Message-ID: <81addd64-6ba6-465e-901e-05f9cb29185b@gmail.com>
Date: Mon, 14 Jul 2025 23:37:46 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <20250616-apple-cpmu-v7-2-df2778a44d5c@gmail.com>
 <aHUeNpx6bsC5Gk3b@willie-the-truck>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <aHUeNpx6bsC5Gk3b@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Will Deacon 於 2025/7/14 夜晚11:11 寫道:
> On Mon, Jun 16, 2025 at 09:31:51AM +0800, Nick Chan wrote:
>> Skip initialization of PMUv3 remap when EL2 is not available.
>> Initialization is harmless in EL1 but it is still a weird thing to do.
> Why is that weird?

Maybe I could use better wording but if the check is not here, then for Apple A7 which has very
different event mappings, it either has to use the mappings for M1 which is wrong on the hardware,
or declare an a7_pmu_pmceid_map, which would just be dead code since A7's CPU does not
support EL2. Not initializing the mapping in EL1 avoid these problems.

>
> Will
>
Nick Chan

