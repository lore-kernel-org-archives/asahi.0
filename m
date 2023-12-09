Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C931548F
	for <asahi@lists.linux.dev>; Sat,  9 Dec 2023 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="LnxjJPkc"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5de93b677f4so12994817b3.2
        for <asahi@lists.linux.dev>; Sat, 09 Dec 2023 06:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702131801; x=1702736601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHcrVMdJq0sD4JbIeT5FBjhpcCUCEVcGkJCuSRTVYiE=;
        b=LnxjJPkcXAD7RZtzWHFI4sMvjN1Q/kgAd7pMZuMNJRYHB19S63twZtPr3UpuqpVrRz
         jkAYwmaN88lCGKCeIayreoDy0ShUNhOw1I+sw6taNvfMDfTAkiKDVorJAWdGNnQp7TkK
         su1LmYXsFhOYgciYU6UOCJyXKOhfHnwq6KSZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702131801; x=1702736601;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHcrVMdJq0sD4JbIeT5FBjhpcCUCEVcGkJCuSRTVYiE=;
        b=rgbz2u0icI7WmKmRPSyUDAyp5QdyUHNuL/vJKJi93PEn0miEgkl4fy8WVp4syWCZ7C
         RlzQFcxOrj3x4NO7v49CA4m6Jx2uW4/3ifM6KpTHxomrjYHK+s3q/MqTmQVRHllbJhi2
         2wREEaZWnMEDCnSGiKHgz5qbvdniiQ+nNQpzrjxlZN+/iqLr4BHFR4jcJukK4lBiGUxI
         XEET61e5bgEzgcNEyRHOmuGVWKHeOPXzzKqTYo5+RSb16BJ8gIeHM9ZnsKs7bOkYRofz
         OmdTNsg3ZyL/Xy5WbjBmHu4qPyAJGzBN2fMhU8fhoD64DiF4Qy1WtfhLifOCxsD2a7iA
         HBNw==
X-Gm-Message-State: AOJu0Yxjpe087bcR6D30UWBifMnZPftkJ66ivoDyPUVJNrLsvfmQefSh
	kWEwwL/Er8MJjV7RI2lrxdTktg==
X-Google-Smtp-Source: AGHT+IH4SrdK6hldLT4XKvZbg8MYhbAZrp5KabFOL+iJzxQagm1R0K6sUL9B0zE6BRNYFgGLyWcroA==
X-Received: by 2002:a0d:f641:0:b0:5d7:1940:7d6c with SMTP id g62-20020a0df641000000b005d719407d6cmr1122762ywf.67.1702131801649;
        Sat, 09 Dec 2023 06:23:21 -0800 (PST)
Received: from [127.0.1.1] (2603-6081-7b00-6400-b2bd-da43-c83a-80e1.res6.spectrum.com. [2603:6081:7b00:6400:b2bd:da43:c83a:80e1])
        by smtp.gmail.com with ESMTPSA id p5-20020a0dff05000000b005d38b70b3easm1516817ywf.19.2023.12.09.06.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 06:23:21 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: Mark Kettenis <kettenis@openbsd.org>, Janne Grunau <j@jannau.net>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
In-Reply-To: <20231201-apple_t602x_extend_memmap-v2-1-a3831a0f3105@jannau.net>
References: <20231201-apple_t602x_extend_memmap-v2-1-a3831a0f3105@jannau.net>
Subject: Re: [PATCH v2] arm: apple: t602x: Add missing MMIO regions to
 memmap
Message-Id: <170213180090.3401106.15464501368527379682.b4-ty@konsulko.com>
Date: Sat, 09 Dec 2023 09:23:20 -0500
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Fri, 01 Dec 2023 08:12:33 +0100, Janne Grunau wrote:

> The memory maps for Apple's M2 Pro/Max/Ultra left MMIO space out which
> was not used by any driver at the time. The display out exposed as
> simple-framebuffer use a power-domain controlled by a device in an
> unmapped region.
> Add a map covering this region as well as another MMIO region in the
> range 0x4'0000'0000 - 0x5'0000'0000. The added regions cover all MMIO
> annotated in Apple's device tree in this range.
> 
> [...]

Applied to u-boot/master, thanks!

-- 
Tom


