Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2653E1552E8
	for <asahi@lists.linux.dev>; Mon, 22 Apr 2024 19:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713814572; cv=none; b=iifH/MHRsOZ/VFUKy8iGO/GtzNuBwuVwllh6NTgHLTbYEAOPWoAC6oXWn3On4Cd6BXxPhDEMB8nbeC4UBwMLI+D37EYORgXMcQBuvOuYfa4uQTij7P072W4mtPVPwkwwnRdYf3sC+pleFP6k+1XQeKfmlERhA2CtuRto/74dNgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713814572; c=relaxed/simple;
	bh=mh2fuIkOYPeZhJF9D2TA4cuxlif853SYnbH9u7QVlMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ByfZKZq1FB96cvAQflsS9/W0xk8Uzu6SXjV6LuLMFUTvcA4Tu/tNGC1GQlirPW1SbNItqsitplshx0UviPJ+Sovozw8U6Tfbfj5YZBkoDmkT3RTUbR7kd/5nkEv2vc6+dpG7pVq8m9oajDLag3CxQVg6ShlaXYX/JdLq4S0bXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=aaiMeshj; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="aaiMeshj"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-434d0f63c31so30426551cf.1
        for <asahi@lists.linux.dev>; Mon, 22 Apr 2024 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1713814570; x=1714419370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COBQdOQFQRfWZfBN8UbPOmShZRnbfaqY6hpmAEWC/2k=;
        b=aaiMeshjTAeGHpEV9UV67Xm6D18HcrlB+l/7d6RPrVcWgrUlKAvxMasoLASYGucBu3
         rQMImuA+fWKJMuOSzSoBgbSP1W3UDYILRLkF/fiUY44qCBmDwup3/zvT8YrsoL1yCzKy
         tZdRze8i54ON0VcnJIoVzwhA+w7mnak3Vn84I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713814570; x=1714419370;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COBQdOQFQRfWZfBN8UbPOmShZRnbfaqY6hpmAEWC/2k=;
        b=uzxEdW5JN7mXtqJ3+yvplaetyZp8OQBF3I/jWfa3jht21xBUedC7JgGW4TvM8IIJBf
         K1vvcT2CAhsta9n/eTehChFULzp71qKCTfod8iwVvZxNdwj1xML93JQK6e60rt8auAPV
         O9zMXUI4D2Rfq57LNVcACZ8zMfyGnmtBaWjvt+48s84AnijZQxQgxiq3/2a757Obmc9z
         Wh4kGliYmjpPrIh5LQrxVbGtnn3YEsofsVfoHKHTbXdoTJHvfnWlZvQZfHW9t7YBtFIn
         QlCjAVN6/b7jHQRtul6/iJ3cZDQN0/vOXLH6e+/uMTRnn8lKvNekAHY4NcdeTZ+yCf7Q
         KpNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu0xQSPe2TLdrQPX2uJGfHRQpgHarWhwRgaR9/O6UQbf0aAKVQZWbdEfdTFh8sSb+ihkkZvtDOaVVWYqY82vWwytYYB8w=
X-Gm-Message-State: AOJu0YycYKwDKocHI5uQK51uTZxqKLqXKbSYbikSLx+pgpSg28poWEH8
	J/MhPOvxpHuO0VcSGH+MLCQY1kfKkew39mH3xp8mIuRhi5EHxF/0bXFreIQ0vvY=
X-Google-Smtp-Source: AGHT+IEAj833KYLhmHczk5YAgfw9XjXZ++0w3k03Ppp/nxFvOp9iZ8T+1OMSlDUlU/KDZi1Tj/BkCw==
X-Received: by 2002:a05:622a:1453:b0:439:d1d0:4d2f with SMTP id v19-20020a05622a145300b00439d1d04d2fmr2681689qtx.19.1713814570097;
        Mon, 22 Apr 2024 12:36:10 -0700 (PDT)
Received: from [127.0.1.1] ([187.144.98.216])
        by smtp.gmail.com with ESMTPSA id kk3-20020a05622a2c0300b00436b2135b51sm4492448qtb.64.2024.04.22.12.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 12:36:09 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: Mark Kettenis <kettenis@openbsd.org>, Janne Grunau <j@jannau.net>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>, 
 Neal Gompa <neal@gompa.dev>
In-Reply-To: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
References: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
Subject: Re: [PATCH v2 0/5] configs: apple: Switch to standard boot + small
 adjustments
Message-Id: <171381456897.1909236.16480561457391281443.b4-ty@konsulko.com>
Date: Mon, 22 Apr 2024 13:36:08 -0600
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 18 Apr 2024 21:00:24 +0200, Janne Grunau wrote:

> This series contains a few misc config changes for Apple silicon
> systems:
> - switch from the deprecated distro boot scripts to standard boot
> - allows EFI console resizing based on the video console size
> - enables 16x32 bitmap fonts as Apple devices come with high DPI
>   displays
> - enables 64-bit LBA addressing
> 
> [...]

Applied to u-boot/master, thanks!

-- 
Tom


