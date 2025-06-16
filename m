Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5322F764
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065093; cv=none; b=AqHJzdP9ln1iv4VxzmxylI/c7C0Pj7AlIRi9aqKXsVLeFGoLAe5mT3VFgOL2VZl2rOM9VDEFmgQiKLHkH4D+0HWFZskUCbW64lkhKT9lUOx3Zjz8UW8+f+VL/Jal+8rcxf2ilvicP+yPtEw5+YuPQx40XEp7A8aUd+W4Anfp77M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065093; c=relaxed/simple;
	bh=vEElryBNL7zZFeTJ1s4TPhoEWiGcSxvnISjWLIlQN9U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JWfIP35CmJHH++0dn0ST0QUBcHiMblpvHD/EiQqQ3T24tpjjZ2QzECp1A5BLSNYdD96+/BF0J2XPNvQikx95udLr3xfo+SIDVTjd4W8Jip1P/TxLEd2NUX+WxJVAs6JFL6qWnn+iQepHDWY1G9m0ud+cvXqFwlTzrR0cY908AJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R20D3x5Q; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R20D3x5Q"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a5828d26e4so38814f8f.0
        for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750065089; x=1750669889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG2mpeuISDpXhdrt6iGw2KiNF6LC3P7QlYizdJ45M+c=;
        b=R20D3x5QEaN6Ywvnx+9dEhP+KCo4od48kvff2cPkVo9QUU9QEwtdUcG2qfQiGJYwGp
         b4oqTUKDBKzZ7zAfHPlYoldfXk/1bm2s1DKgxJvx8trz5tvb4QSLyRKAlpQaGCVU/8zW
         +pmXIfJXgBzhMo9DPm+XTspKn2DU67CPYjtu6CCN3RbHL1+RTub6ZSa32zr7l/90SST7
         x5hDT2nZ6OfUVLh4aDuStPO807hKEDcNYImjS7AxZX5e5d030+/Ewz8p8yST3rQ3Uh7m
         oAT4vOpnhDypTvInW6VEwwskou7B4BKuBxlzdZdD9jnhicqLydVW5LODChho99Ipnu0z
         nmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065089; x=1750669889;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG2mpeuISDpXhdrt6iGw2KiNF6LC3P7QlYizdJ45M+c=;
        b=YVzWmKh6eKiZQ8WQk3DqmrV+gruZdaDBttG8VVZLD9UNBdXuZ8D0OsQlJ4lJtZKfPj
         BA1hbvia44tRZdUtQFBkLJy9+qk2ojOqf3be+G+dX7rdUeX4Vg66MfrMwXIkVi4+Bx80
         v18k9VMpwEl3pECnMzz18ZJMmCDu5ZAi3khffV0oXwrBGLHQY1wRBxgur1EsuIwXX1v+
         mHbzsF1Tg7EHpzmfCDM904PswuEI5Q4VhRVzeALjagDdsNRVeEcv23HRQk3/ii8nRly7
         MTks618QdiXciKNqGV//2YELUtbtFcneQlm0PM8pD1GbYd5icO9y7kXPDekXw69yKHAZ
         PZsA==
X-Forwarded-Encrypted: i=1; AJvYcCXZMb9IQ/8iPQAUHF/YmYLw/Rt1TA9HzN/PshW0JCJMOV1Cv86l9u2lFaqYCv/YJ7AlH+jN6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPY4QggAsTHvsbn42lHMdYFUu2tO+9SYbGhik2jC0ujrvr4wUS
	JeN7PF6ClRs+734jQgrMvzWJCkPpuB/lPYj6fwwoMNyUBd+Gi7H4p2jyxjVkYqKakF4=
X-Gm-Gg: ASbGncu5TyHkEA4V3mHCIbI+F8ad120LYdPB8oM+q/EeWJ7H2MbkcA1MOefv/Bsw9Nh
	7+hwcAlvC1sjHYSp+Gv84Ad/KgTuzu3Op6wel1MFtHuykmUiLWg/+ZCkwlp+wnoWG/oJptgF1A0
	GotXQnsfCCsPhs6+Cv6P3q6Q68OmozSOg73ykd1UE4izgALnGkI8Pk5YJrTI+6nsnq8eOYtAaCi
	WZa6Soh7dfc1GUOMWPgtVuRSCigm8iTA/23VQGskkPcwfe6vnobU+u1KfaaCI2Zb4i+wghJCO27
	3/mWsZVUsUBI8rOfDMo8OxQW34Vh+LyLZov4q4PXJ8toxRnYaIsn+tBXyLChywz7XYEHMbFJwjz
	/T7zymZ8=
X-Google-Smtp-Source: AGHT+IH1WB0/sw9sqaChH695gvNYuYsdGilhFE4QGQCFNv0A2lCd1A3eZdG1Rw5dHdNgAoDh7P85qw==
X-Received: by 2002:a05:600c:3f9b:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-4533cab4477mr28464145e9.6.1750065089320;
        Mon, 16 Jun 2025 02:11:29 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1cc5sm142655045e9.16.2025.06.16.02.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:11:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
Message-Id: <175006508796.28664.548838572668518596.b4-ty@linaro.org>
Date: Mon, 16 Jun 2025 11:11:27 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 12 Jun 2025 15:44:22 +0200, Krzysztof Kozlowski wrote:
> Sound drivers are not essential to boot boards or mount rootfs,
> therefore in effort to reduce the size of kernel image (and boot images)
> switch the ASoC drivers to modules to decrease the size:
> 
>   vmlinux: 152864 kB -> 154528 kB
>   Image: 39391 kB -> 39067 kB
> 
> [...]

Applied, thanks!

[1/2] arm64: defconfig: Switch SOUND to module
      https://git.kernel.org/krzk/linux/c/927f1259c517ec0dc589f5014c4edbdc87591cd8
[2/2] arm64: defconfig: Drop unneeded unselectable sound drivers
      https://git.kernel.org/krzk/linux/c/a8365bfb249907069fb584a535d03c291157ddbb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

