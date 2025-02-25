Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D44265610
	for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479142; cv=none; b=I4gRDnY5mWF9BXif9UOO4d9Uf9js45kjz3mWiws4CWMzh5izIdxtQrb8PZPu2l7ytYTOOltRpKx+VexyOT4WnfN6/h3EVlNOvr9Wpg2MBbAebizNpfe2P6n95tIhn3j+N7ql9NSmCYBgSp5TcM1h6EuIe/jwEViixKsgUMfu7Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479142; c=relaxed/simple;
	bh=JXUEw/mTrCXp4uW0hpKJGSmWwnmo1L+q5KtrwP5O3eg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DAJob8B5EkfG1jep9xiUMA5vJ+fycvJIl8rwvwPVG4vBVbjrOdVey51QLVBa9t+zH3Ea3WB54vSY0+4MZ80DIXVbMEv99Od8VHjM8kBNDPCmRI/Jpqo6YzRE631lFjrjkPYu350r1gTCsdsdoAtvDE10mHlzuQ/H4wEChWgHvvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PmGU1T2m; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmGU1T2m"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so3927348f8f.1
        for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 02:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740479139; x=1741083939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GO+8glDRZ70FolfJHUuyOyuSWWMeXZ0930x4j7bHw1E=;
        b=PmGU1T2mqmMr1T3ybM0iJ0BH8FvhM/cKrKRfEtmb8/vHScQD6ttCZFKxwGdnVu0+lb
         bwheTIPw1fSZAZCot+V5FNqTDQK+SfCvPmFM5w1wWPGzGpHxzqrvw3+7xbmREcr8VBu2
         4z4tUApS0bK6+OzH0AhgLTiUx5K6iswMjtH8QqzacMHPFtNkWo0ggXsuxlBungdMf7Ja
         6+0/G7dy69YcE4TxlVJ7X0oPtNL7SVYRXGYSxg5joXBLiuLUxh2ZWt75qF/ue6kZ/eNF
         H9SJd9YBZEM3XzVuaSAV2rbC3cHQ/PpiSaYunmg9W7uLDyxCJMjZSbaYYsj/XARDMMpo
         Lsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479139; x=1741083939;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GO+8glDRZ70FolfJHUuyOyuSWWMeXZ0930x4j7bHw1E=;
        b=Fiji0p9g+h3p5aIsmaP9iN7EUseCEAM6lq2119uKb+aAmD1UN+MOj4Po1ge9DHz4OL
         STHZpi5KgdZjSKb2s4JYNY+aRhITK9W3YaC/gqBZ87DIC5t4ZiuBBPSjFVZ2SQaAqcA2
         QJW4GOznBPMoqBxGui0aosI68HRMPJKyVsfu/5zKRDhUL43qwRRArFIw1xZX1YjBqnZl
         8meSgGooghMNjrrkQG+FVr9lkRJqIm1hbeGhiIqpA6VuEMIiX3Xwzn9Tcm7KEiMH3WiK
         z44BsU4DrGKRxb5/xmxHGhY7MOaux+m4MyNpWm8wsAMD2URu77WWcPyvJHEO/ZWe8X/8
         MuXA==
X-Forwarded-Encrypted: i=1; AJvYcCVoaIfquwr37+rFCzJpSAu5rJRF2un34zDSS8aXXqAyIv6MjfDTnvDS37RCOjvLIOE50FMZxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJeVWgiEHAH3vi/Qme5JYQvlba+guCgMw4mNzuKr1ZXcB4sb+3
	U4zAUuV+5r0dj0pD19KJO4ssc7gdLu9gy94Wng39gzh10frz9VFau+DyDYF/Fa4=
X-Gm-Gg: ASbGncvZ+Uutf8gv9bOWw3NzOAqjrEbCujSqPLZX8ON8p+J3Mxqo2VKcn8DLLky/bmU
	5nyIcv0AqZaTXkFnJi9upBJc2n+PrLxSr4gzdPuTl6KX6ycUoFx82b7PCqaNA8G96bXBBfeofkw
	HbjeW1TyDL88KeElwdqeHgYlFCQ7HnAY7POg+vcbN10CUbaR7f+hcGUteeDEel0Bc96tgzJTmUx
	QEp1QSgAZK9rLVsgSLnomReAy33TPEQZqhRmOAKJYekg2OGfG0tfWInu37whO47HUag5HV/DDdy
	yaWQbQBjKK8Gb2XXN/ulBqI8n8LpKilPoQ+PwlWmAQ5q7t4=
X-Google-Smtp-Source: AGHT+IGCJja0+bBP6yFXu5tgG751wKC5th2J7f0lmxV62+z2DFSuW2JXXrH5OxE79sHt4myCc7POkw==
X-Received: by 2002:a05:6000:1a86:b0:38a:8906:6b66 with SMTP id ffacd0b85a97d-38f708267ffmr17605833f8f.38.1740479139095;
        Tue, 25 Feb 2025 02:25:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86707asm1764378f8f.5.2025.02.25.02.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:25:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display
 controller.
Message-Id: <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
Date: Tue, 25 Feb 2025 11:25:38 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[3/5] drm: panel: Add a panel driver for the Summit display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4

-- 
Neil

