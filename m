Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D2518593F
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 14:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726063850; cv=none; b=iRoIvxETREw1GWvhrAenQ+lhiFP1HrLrGDi7qJsU5vYI18j5SXAuPGR96VMgttaBYHSz6WEyhmfEYllkqG/j8vsBL6kwgh8Qga/36Ta7F7IWmEIMy6qJitwVfqfEIKDnPv86E3pyMvgJTHeDDcURulmrFpuBLPX9oTn2RSqa6bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726063850; c=relaxed/simple;
	bh=ZK2+IxRNVqlt2+SM3hV6kWAM5192f+KQT98Sa8nIYdo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bq12vTWmeFWuDCfkWKJbsxds7yBcQgH7LEoo8d+04nkzRyfnucz0v4UbsHVxkBpzIGz19sQn2HcZw/EyeZQ/woX8+qJDwrw/0LxkhyujC59R+7bd2pckUk9YUHuIBdE5bx672s/sO7hDJWJbko3yFwhJVDBzULnbtihCsb+72x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ke+P7cZR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ke+P7cZR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2055a3f80a4so49001435ad.2
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 07:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726063849; x=1726668649; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UHmfW921nMYPHNEVvSEZf5hsK+I8JZQzxqbgs7+8dbY=;
        b=Ke+P7cZRNtb/1Fz0A+5Mg4SHpRh3HMU4ZYxJneb4e+xHboSIUCK+fycFTjQNYZxK7V
         rg2nSVtyXPsqlych0eBdcBuwwNUfGMGaZMpQu2qZhz2X5KHNjWAladd29nS8bhDlPefp
         faEOxAyUxY2Scp+B8WH4rFD5j/Utxog3gm/NMbL3PanJqMcpunlHKBMnVdIROlDarE8B
         xNNWYVvvTIPWENTRCt1ia6/SWLVCqffaCOuzsztlkF0RwbaqrjURyMRpMrtnwqp8+JzQ
         tmtztHV54L0JA84/IK3cx49IR3t76yXvl0OTzOAP5DXZtSktA+dY8ArhmsXOMdUsI1V6
         CTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726063849; x=1726668649;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UHmfW921nMYPHNEVvSEZf5hsK+I8JZQzxqbgs7+8dbY=;
        b=t9ieWyCcd2gEb8hsOttzfd2Sier0XjiAwi0rGx5te9HF9SxqyVZFJVlZRAkoZXX8/Y
         B6uB0rUnIxcD72Zc9z/VuWuixxnJWv3tvPsmcreeKpXXvsEtDdSmPwJUWtKzRF6SbD/O
         nd0y1z1Iu5Ge5A3aGRS25VekbFjYr3B5acjHKI8bS74EZChS6q02KrEq9kkX6rG262ID
         n4KHeom1bDBld+jXxLG4Elnr2398BPbAGNKtfwBmIl8L6wKIiXBVVhKbcOF3hoKLOlcs
         kPXNYQBPnifuFKhKL5SwRSziDvqIhNAWMwc2sekskH3FcN1/RN1BUp5HNij7NJ4RY2d4
         BmjA==
X-Forwarded-Encrypted: i=1; AJvYcCUXKxApjfTlKdTxfilqb7mHfJTz0gyVKmRFlQ08qwxcg17+59R460RkpEpPHbum58ds+vZOCg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1Bd0PQ2wcooKasF1J3F5rE1d6GID7PH1+qu+U3b46c8mVpmd5
	Kk/ZisqBAUBbfpumjGN0W0wKlllAG8H/se/ZPWgQKMVozexkunRq
X-Google-Smtp-Source: AGHT+IGrJBh462kHYswwLIVvVm5LhvRtm2F/elyjLvrWN1VG/mzjIm1UzoZqu6qi8hy8Ub1yQ5B1YQ==
X-Received: by 2002:a17:902:f646:b0:206:c675:66cc with SMTP id d9443c01a7336-2074c5de235mr57743545ad.17.1726063848732;
        Wed, 11 Sep 2024 07:10:48 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b01a896sm7975ad.298.2024.09.11.07.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 07:10:48 -0700 (PDT)
Message-ID: <587a431c-c62a-4c29-9c69-8a256a4b84a0@gmail.com>
Date: Wed, 11 Sep 2024 22:10:43 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] Initial device trees for A7-A11 based Apple devices
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
 <369a32dc-330e-4827-a61f-5686f7d90a07@gmail.com>
Content-Language: en-MW
In-Reply-To: <369a32dc-330e-4827-a61f-5686f7d90a07@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/2024 20:13, Nick Chan wrote:
> The Home Button probably should be assigned KEY_MENU instead of
> KEY_LEFTMETA.
So this is a bit confusing, there is KEY_HOME, KEY_MENU and KEY_HOMEPAGE,
other phones like arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts seems
to be using KEY_HOMEPAGE, so I think I will stick with KEY_HOMEPAGE

> 
> Nick Chan

Nick Chan
