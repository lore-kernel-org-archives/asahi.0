Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A8513C9CF
	for <asahi@lists.linux.dev>; Tue,  4 Jun 2024 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717517221; cv=none; b=Y4HMaWPKU9czE785pEpYDsV+OiY3HilvuZETLPsAjvLGCcMPpIH8wTybcK2qIMmcY+ggJ1+LPqS6RUTq9QnCwelLEYyQjjkk+ZaQ9YWHZtlcaflQav+G/OzxwDEQii2YpMA2uFkcIKtYqJAPRzQgV7RUWCQkDdA2H+YRoZVLBMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717517221; c=relaxed/simple;
	bh=GfgdfxzT8n8+FRMuhvSXa/oYSlEgqKTOgyJud5hAWa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LaMPGTYwLL54bGn8fy4RY8dIP0mhnJR7TgHxfAPHfxMec/0KJ9JfbbwyqRHrCd+v55LKT9Jvx5caYPwXoz9pyIuNGZKvQM69UBUd1TwLOPxW/1diRTUrGZcc5hVx9a/O2RwoAKuJ9d2q46sayduO/CnEi+OH6VF/jRSREBXk0zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xd6BfFZs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xd6BfFZs"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35dc7d0387cso5899810f8f.1
        for <asahi@lists.linux.dev>; Tue, 04 Jun 2024 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717517218; x=1718122018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVcQEIP+MENTssUPsqaOZqlKvsqibx0etjqeiTYhCrQ=;
        b=xd6BfFZs8JlKDlfGhe8iQVUwOyEXIk5qG9w0APrD16OBi1bCyTAVPabo4WRrX8PCTS
         VecVUMHo18IK7huz62FdCu8vjpHiIRcO6Os9cVUh1hyeOABrM1S104c5tTQNooVJ6YTM
         kf0Ki7UIKkCyCgQ1UIdlpNBP2+bwIwgBnOPVMWoE5WZMeMZwQpmG4MChDHbHZ1U2LpRb
         A7FVVca1XMoF+MeXfUGRnOr5e9EF0f+Y3H60Pg/P3klXsQWtbOw2hP14QXuR3Gk0CMlZ
         F//5/xjOW61ePAISMU5t/k5A3E/zRD65O2JD8PYq1l94MKhk66nBrsVIOQwG/j2mHp34
         K4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717517218; x=1718122018;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVcQEIP+MENTssUPsqaOZqlKvsqibx0etjqeiTYhCrQ=;
        b=nh3ET3H0343y1yKJ9Fhz9sOpL264jJjOFQoYREMXiPw1xooIItmrSUhSa3gDJ6HAt3
         iYX7ILsvzBBDzXaEV3IL7l9ufE8ebC2LeXuKKP6fY9LhA57BSh/i2cTdiZB/6eYlWVS5
         Drdzb3pwInuxqD14FEZxaMpxXjvEOcpI2QbAkk0jqYiDs9rfRzEuRbxaWrsGDYf0DztB
         8FuCL/rHCUVKOSRClOTjndmOvFBnNIj0UIoPmabURCWBXPg4EogtYAab+mWjwl+qfak+
         GC/TBCL2n+lN12uW0xN4BO9iF8Lwg8WrP1HkdYsJccRYspHy1qjE7V0AbrfBKe08XG1B
         mMGw==
X-Forwarded-Encrypted: i=1; AJvYcCWiI0Tyi8xbuaBR7MRp1TGlqpcF3JKCbC6hISLcKOtHZf8NQ19ruNElCtT3dfLAxbO92NlodSC7rGtMKkEQLgPYTgTnbAE=
X-Gm-Message-State: AOJu0Yx27+qnTEFZAPk7oJmhInhF3KwFUfN1lApyUxHUD3xSPPmr1eOl
	JOSNYz032sTV3yiqGw6w4VYUw6kJ+8xGsCSsKfxoBPMnq7l7HWa8FPw5zcwuink=
X-Google-Smtp-Source: AGHT+IFYA1dhRvmL2GTj5Q6k/vk2zOUsQMMogmi/rc6o5NV9inVq5WoI7Vq75aDni69dzFSZ/DMrow==
X-Received: by 2002:a5d:438e:0:b0:354:c43d:d5a with SMTP id ffacd0b85a97d-35e0f26984cmr10765554f8f.24.1717517217961;
        Tue, 04 Jun 2024 09:06:57 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04da756sm11983392f8f.59.2024.06.04.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:06:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rafal Milecki <rafal@milecki.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Joy Chakraborty <joychakr@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 manugautam@google.com
In-Reply-To: <20240510082929.3792559-1-joychakr@google.com>
References: <20240510082929.3792559-1-joychakr@google.com>
Subject: Re: [PATCH v3 0/1] nvmem: Handle actual amount of data
 read/written by suppliers
Message-Id: <171751721565.70889.16944298203785853489.b4-ty@linaro.org>
Date: Tue, 04 Jun 2024 17:06:55 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 10 May 2024 08:29:28 +0000, Joy Chakraborty wrote:
> This Patch series stems from discussions in patchset,
> "[PATCH v2] nvmem: rmem: Fix return value of rmem_read()"
> (https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/).
> Where we come across the fact that currently the nvmem suppliers do not
> actually let the core know how much data has been actually read or written.
> Instead they are expected to return 0 for success and the core assumes that
> the amount of data written is equal to what the core has requested.
> 
> [...]

Applied, thanks!

[1/1] nvmem: Change return type of reg read/write to ssize_t
      commit: f5de138db5b76de7d96d4cf92f871ba893ba0119

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

