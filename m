Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00BB21ADC7
	for <asahi@lists.linux.dev>; Wed, 28 Jan 2026 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608955; cv=none; b=SV9+ZeJ73EBLZiKNOARdHi5FSoWfCZZ5H+po5mWAAnRNjIG1scIjmSPNV3zNFmnJ4o1P9VlY6qnjBkIi6KzazlQFoNBtEusEZUMskUQXaYEnnEn29FCClZBGJEJAst44kwfjvb7bQyWRHkdE94oQxElJ3sUJHGYg1OggfFgup3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608955; c=relaxed/simple;
	bh=WMRlzMVDmo8vKvMRYmEZ+rgJPIimiXSy56X2JdUaMAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ExGqA5X6oblmJFu7Y1F7Iv80h2DzwtDfNYXUgmTWXTWji/adlYlsYIYtbAm7vbFlS19RiH70QyYQBACMSu2KdbsnrTjZRAazbMr9re3Jj4ptS6KNLSmtA0lNiUfwJz3+4nYKcNY2hNJgu+Ful0o7qW5BFUu9AixHPOIzTI5z9Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=lk8P6XTr; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="lk8P6XTr"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45c92df37fdso2866567b6e.3
        for <asahi@lists.linux.dev>; Wed, 28 Jan 2026 06:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769608952; x=1770213752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWsTc/+qgmBDsXT0kOjuP6rjAwpiP90mdbVbix07OTQ=;
        b=lk8P6XTr65GzyyTUMwO8Av8ICoWPqquIwD39UdaF5B57THfkXrCHJFrE9BIchJLbC1
         IkvaS6VGuUpRU4OTBKP7+hEr6lKmQDJwXO4+htgJt8p9xRDnkNkyZyWXxSGNosDaR6Tv
         4fBgFRBeMkOQb/ttsjxVQqLILX+NL+w6TS1dQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769608952; x=1770213752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWsTc/+qgmBDsXT0kOjuP6rjAwpiP90mdbVbix07OTQ=;
        b=tbflBgSQKHAyGe/8zcdZ4mBD67iv2mlheYmojuonTXprXIPKWLVLVSu1F30uyORqZK
         idFNTY7FOwJfbVg6oIs7uq4/xHXTBYskL/md843WtBCgUrnkeR9HmFIjUjCTtBH7/Lqk
         iql7Sz5LcGwoiiqYbFPDhgSU2DLj75p1w6Em3xtQVG3YvnmPk9Ww0ptJImOudbD75kE+
         5EP7QZlH3yuFZVPO4nPnKLdF2RQCxz7dmIl2iDWz2a/2nrhTnR8m9sR1EaRhQ/Isa46R
         +bZXD/kBu6c0NHxSMKKJIIcIPklSb9liyYwibw29ZXxgsNVKptlK5D8bybqI+aBtBxWQ
         I1RA==
X-Forwarded-Encrypted: i=1; AJvYcCV0JzWWR8T5r2+uUy+KibVI7KJRMxt+bb3uCWZQ3paP7Yen6/cTl4H++zJvlHMQlUvmjsVFOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyV7pnBd3crexbcg1CVyyPUxyxf23XZjDzUfL7bizI1OZrbsxDr
	f+uXkV9h4Qc7YEYwCDaUx3IGupJdfmZEHKWJIK3p9I0xgWrCgFlHgUfyAqRrnJU+S00=
X-Gm-Gg: AZuq6aJOaGDCqfzPzFoWfEDCvVpIps87ftCZERCaeLuwp8MZzwr+NxOzU2R1qm3c4QV
	oEz56/zJVNlWS94L8tNSMpqYaUxFPz9U0RiiJ7JVd3HkKMSzFaRC7z4+uTYgqqHzgvy+Sl2BZ0i
	ilQ/QFJX2owYsGjM+TgUIo6+CZ+7+w4spNYjgIOCX5HmxF+Obo/AO/UGmcx6IgbGUkNgcDl//Bj
	rS5JVTGzrYHnWlM0oaCBPrGJYMoILsxtX7RXwCtFAWRhI8ud71k+BeZv08fXyuXrYNzmuru7OGs
	QZMvyUNkUT+xDDDY3ZDMR7d86KPzIt++uEewIW3HDOi7neielAUJCnBYjYFL3G2S0uRzVl3MVgP
	ZpHmc27QM0OA++m2btb8UppZbtUlP/U9olquHNFhAJQBzwspYrqH4qCXItJIx1anVXUjGUQvzjp
	KOzyY7FTCfkuUyHriGLZ27gaZK7Ti4TTMEyNsCMvZFwme3lrNNnTPqat1gFP3HOYzGkZg/EhyoI
	f7RzHduGGSfqGecv5Vt3MCMed8OEPCqv3f4Mw==
X-Received: by 2002:a05:6808:3507:b0:44f:6a19:433e with SMTP id 5614622812f47-45efc5945fbmr3413519b6e.15.1769608952471;
        Wed, 28 Jan 2026 06:02:32 -0800 (PST)
Received: from [127.0.1.1] (fixed-189-203-103-235.totalplay.net. [189.203.103.235])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4095749f332sm1751438fac.11.2026.01.28.06.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 06:02:32 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Janne Grunau <j@jannau.net>
Cc: Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev
In-Reply-To: <20260116-apple-defconfig-smbios-v2-1-861d707b466a@jannau.net>
References: <20260116-apple-defconfig-smbios-v2-1-861d707b466a@jannau.net>
Subject: Re: [PATCH v2] configs: apple: Enable SMBIOS / sysinfo
Message-Id: <176960895173.1640006.12564542066569295472.b4-ty@konsulko.com>
Date: Wed, 28 Jan 2026 08:02:31 -0600
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Fri, 16 Jan 2026 14:44:46 +0100, Janne Grunau wrote:

> Enable verbose SMBIOS table generation so that user space applications
> can use the SMBIOS table to provide details about the system. The
> desired information is chassis-type to determine whether the system is
> laptop.
> Adding the chassis-type property is proposed for the upstream device
> trees in the Linux kernel in [1].
> Enable CMD_SMBIOS as debugging aid as the platform can easily deal with
> large u-boot binaries.
> 
> [...]

Applied to u-boot/master, thanks!

[1/1] configs: apple: Enable SMBIOS / sysinfo
      commit: b0c6b5f4214ed1b76e3dc9efc6873ec441a860e7
-- 
Tom


