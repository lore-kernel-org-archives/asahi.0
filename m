Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34506178368
	for <asahi@lists.linux.dev>; Tue, 11 Jun 2024 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098204; cv=none; b=qqsKNLviJoKNH6k6Id5to6BVz+aeapetjQiS/z/p2vej4g243J3tdgPZ9plPiwAplggf8TzIGX5bYNMbiTe1dnVdrzTq5EI+yghHzLaQ7sQAjg6CyFMksaJuBqT0i9a/P0tLO4nVuWyfhTL166H7AlHqr4OcSZzgGJem2gXFBfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098204; c=relaxed/simple;
	bh=sROeVyOWP8ju/1YuUGlfVA/lz/40KedsP6ga/DvrQF8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o8kyhv5xJyooUxQmUXwpRaXpo702N3Uuf/qm2SCvX2UIM82cKxGUxzT9/Nx8mhBUsQDvZuZePtA7FQFD8sU7gE885fT8l+Wc9imJkcfQKPOxc4jO5fPqGinSJAcYdOEGEmYo5IE40FpvRvz3c3VsFD2oUmVlGMHtsAweFGKlu+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ivofF2lz; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ivofF2lz"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6efae34c83so351585366b.0
        for <asahi@lists.linux.dev>; Tue, 11 Jun 2024 02:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718098201; x=1718703001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDDStHJVnEvxpIADP0VNO9TR02kZEk+naFrQocyHQd8=;
        b=ivofF2lzuuXCTILP8TFJ76VTDPIO75a2lmXvkaXX2R2I2+4YzYysXQN1ypJsY3L4sn
         dH/+JStAXnTLcfMGYGWppABUReHfEqZOWZAh6UwIUxlcETDW7WhO8P+AbKWYdJIqUsez
         IScyqdcCM+a1TEb1CSk6XOM/Cp2q3yWJAjkRr9WGbI0Hv4udmoUJU6bCshC1tNeL3Rl7
         vaI3iMwhpOcgv13pkj0j8F70Al6jtfgebzzGcXDCAS4u5WqpnZ117iymVpYtNW+wz5C8
         kkSNZM3sDrW2LPUgKy+jl9kb6V+oMg61gt4SyIsKxZZqWxoA8T0FWdFqvM2Ix4HiHlx0
         RjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098201; x=1718703001;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDDStHJVnEvxpIADP0VNO9TR02kZEk+naFrQocyHQd8=;
        b=DPwY+uvZ70Fy3zXEJ2kCONZiLtOuf/0HUTKaBHv80frtzOxfmYQfMSHZ1WD0JpzYy7
         DMvolJaN9LQDMAxtgWfXXSWPSaOggtO1QJX/sBrIHKPdFxYOPWUKxbkuo8AMvCy3wd0E
         Z3iI2/jAmcxMUupIHF8o/5E/qj9lVDDtq6HnAHV4Yn/fgfDSkzEqMltRg5j2w9LGfry/
         uTb1gJsNVYjnloEH4OsbxOVJoIlZ6mMwQ1mCTjiuAtobQxosRqRcsriVdojFN1tIfy8l
         iikk+Gh+Ys1uyoUV4BEYCXs76L430LfiGhhkzdCiu9eOpdezpCeuFbQQwOk/9xVJhhXs
         ax8w==
X-Gm-Message-State: AOJu0YyP25DcrlBUMCbJvKBgylze4376X5p4zsflOdWE158rX33xBpya
	TqPnPspmKjAgxfMUIpP8HZrmSeL/lOWs9zV7+iTMCt04cRaVDn8agjZtbbdq/J0=
X-Google-Smtp-Source: AGHT+IFy7enofklQCZekReZQIgYTREHNstyvhStXcx3ghHAyAYVYwn36q+89r7o1pxmzUZJ0jiWVjw==
X-Received: by 2002:a17:906:e0cc:b0:a6f:1872:4e1f with SMTP id a640c23a62f3a-a6f18724f43mr308823766b.77.1718098201313;
        Tue, 11 Jun 2024 02:30:01 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806eaa4dsm735715966b.110.2024.06.11.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:30:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240610-md-drivers-nvmem-v1-1-c5d378597cc7@quicinc.com>
References: <20240610-md-drivers-nvmem-v1-1-c5d378597cc7@quicinc.com>
Subject: Re: [PATCH] nvmem: add missing MODULE_DESCRIPTION() macros
Message-Id: <171809820035.51273.16981931013045082641.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 10:30:00 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 10 Jun 2024 15:55:58 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem-apple-efuses.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_brcm_nvram.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-boot-env.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> [...]

Applied, thanks!

[1/1] nvmem: add missing MODULE_DESCRIPTION() macros
      commit: 43b4167fcdb91a57d6102347a6f848285aa214c1

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

