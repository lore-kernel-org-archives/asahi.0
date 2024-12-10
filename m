Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEA322E3F8
	for <asahi@lists.linux.dev>; Tue, 10 Dec 2024 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733820439; cv=none; b=CfCbAMsoYOMY/+jgPM5/5wgdHfq4+FC4VByVXzgNWqGU84MFpu1mZHUJi0hlyUEioIUTVwiJ/YvcDBeRQrtnwIQXILYXCoHagTwYfP4uCU+D0pCJfNv2kLaER9qjWyrxbe2NWh9YVKISBgz/Rw2XZ64oKy0/LxdFmbaaKltcu7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733820439; c=relaxed/simple;
	bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JioUicK60y4E6YtB+WlhwkgxZOBNXezwOSxRHZ8YZlLnKkJ5euWTRbF0lEkkK77rg2YgxoTJYdUSR+pZsQaPrCN/1WemTVIwDoLjafWRiFOu/ltSp2CTEfQ8nd5WjW7ag359U80X4+oeDME642wrogBeUDQwePB4//M6UnhU4Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtBlBnf0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtBlBnf0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216395e151bso15286825ad.0
        for <asahi@lists.linux.dev>; Tue, 10 Dec 2024 00:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733820436; x=1734425236; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=;
        b=WtBlBnf0UvTtVFyrFy6EknR1UkDpb8PsY/ZHzRTB4y4jeh4uBRSfkdofKX0x37dBvQ
         Aelx4YCRhNiHzbEslrgGck6m0TwzvOV6Wdui+Ksi4pQ7UPq61oRLibb3zVP3p5RB417d
         4/PUt0kpJU0tUEB453yRvVfOZHA7A9F4B4SKzyt7kT27tRa9zW9E2GQ2XOozOERbLT9T
         lz+69Cy2S/AZahoTaxGKdDwWRqMTqaZaQQibQlp0k+1zPye5bImtFYoZqA+RuXam9a5e
         oleEh3iyntrp5r7ADuLMnUsfOL41EraHyxYHUrSBnIDjKUaJKUz66cFkwVR738SbgQ36
         HGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733820436; x=1734425236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqgJ06i6Y7xo25MnVPg+XILEuMsyhZtOxmam3qSlkFs=;
        b=vzC4eR3maeyz9c1mIR8nThgydtCoJq1Ba4i7Lw0rP4ngDEwh+lCyuY/q7r8nVQXRWv
         0MNYrguBWGimjBiUjKwvuDZxRIJYFO9invmswo7BzOFyRbk7kI1RV97TT+Afe2sHw5Oi
         ST/ep/yMhd8l/w/Xm3x/8Oow1uknvyyY2+uC0tCutlntglY9Jl9+47L0GN3knDVoxpOh
         sFrvc2Rt17Pz0mj7hQ94rg3oyLPjIlynIuP80Gmwm2KCykzULO9H+3g7MfGBfR64JySP
         wXG1Kmjd+TIq+U9HqL7R2LlWQucm/EcnIMbQ9pF5xrCyFegHDpPKOuVeiY8NirTCWYZ7
         ULmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj7GFTI+D9UGCgg2OJLR8Bj31/LRFxo9pG2+uYcoJpUPvmKnQyBGw5e6SoIIIhOjYDWBNBAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiotaDzP/MmEUpqzrhHjZbCq5J+dGTzNJKq5UqlZe218AoLc0e
	QnBfOcyxvAXLklHLK7DRpR3Ha+B5vF66Xny1HCS2M+cbwQhITW9g
X-Gm-Gg: ASbGncvD5PnUhtlSA7ZXxCRxTaQb+lTLbrW8VQahag7XdBKUwVpssBG0Q2lUQs526hn
	fSj8R+S52o8m16VTBsPVsAf00z9+H0Rnaybmklqekpa5eTqby79K/gM9EmlJfBv8ElGxH5DYR8Y
	7EG7XQV1yNescrpEPhmIPXUMH6z9col/SuKoh/nuE7HpxRePTwPboLCeWqoY8BGGE4d0r7lDrHq
	aMzcHiNk3g0RFxccLGk0D55l/5Q8Nwh2HKG0yJGAv9XuJhPgov57M0stPXBchgJmL/tS0KNO7OC
	AA==
X-Google-Smtp-Source: AGHT+IFyFx9u2Q8EBc+BBmDXtC22UJjW0IxAAzdnx72zpqdewbRBPV5UQPIkvDpar7059Mt3H6VwCQ==
X-Received: by 2002:a17:903:187:b0:215:a808:61cf with SMTP id d9443c01a7336-21670a47b3dmr40495715ad.25.1733820435973;
        Tue, 10 Dec 2024 00:47:15 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f26c6csm85230675ad.233.2024.12.10.00.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 00:47:15 -0800 (PST)
Message-ID: <23e6d9c0-c3d6-40c1-b933-01c5a9ef43f8@gmail.com>
Date: Tue, 10 Dec 2024 16:47:11 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241209075908.140014-1-towinchenmi@gmail.com>
 <20241209075908.140014-3-towinchenmi@gmail.com>
 <w5niokvjfwajnzz3muccb45jsvqzg7lql7g5tg5s6iat3mtqkk@qu2a5zcp3rs7>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <w5niokvjfwajnzz3muccb45jsvqzg7lql7g5tg5s6iat3mtqkk@qu2a5zcp3rs7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2024/12/10 下午4:32 寫道:

> Nothing improved here.


This is sent before you left any review, v4 will have improvements

Nick Chan
