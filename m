Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F523DB636
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010533; cv=none; b=UZRhcuJ7wdyfwSQqIv7rcp9hpP+a8qwO4RCL+BP6iobjpwbJkcp6WtZkkZEEO87WHqsF6cXIdJb8zxaC28rokpxGH1MJwl3O60FuEcocJOkN0Bj3zST5/rN01eM4zXVtG6zyPPptkx6nsqzmGkrzr4ubZn3vBPo/pliV/8X7fgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010533; c=relaxed/simple;
	bh=uEOX/VWb2IzaqOqmoZJ5LrpiOfc1OnKwSpPs8c3o0oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WinTAqq2ougceRDYxxB5sThcIK1pPHbHw6UDuYS+w6MfwU8UUsS2e0jOBlHoW5h75ChZg2PmFvEQiGRhGj6I6UHeyk+OXRyuxeEM4O+aQ0HcKiYGG/8f7BxKit0tNmrZegF6CuZY1DO5DQn0uxvHj5bUXBizXPqBMOrRW7K/+7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hx6sElEU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hx6sElEU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cca0c5799eso7146105ad.0
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010532; x=1784615332; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=;
        b=Hx6sElEUouCGM9tYI7kUhtOUV7BfgDwCY2C9FjCO1WSmOgSWk+n9GgSikKdClHfc56
         SnIFKrzVxNO3r7ECPWtXxHEk36rdmyC1SVVjsS0hWzfW/iwwroHH0ECTqQ2of8gCEuwx
         fPbTDtB1AkqWnQon4kVGYOPBC+GtnOWatXvsDCx7pDpoGERWhxTjB5stmiyZGZjzJZwU
         9zqmJDUkMPAVnUsoiO+Ebp0JojBkIn2Ai6oVjdbSp5TkKjE+0/cwjxiM+iH8HEvHKmUf
         +XPT8A2gWOsPRTALO8k1mxyts2jCau50bXmvIpVwyaNmANsADB3ykwSj2FiNsBN7dmz0
         WhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010532; x=1784615332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=;
        b=ZgSorIrEV4ZuLqPmykS2ku9d5NXRY2QZq1Y0nuoCgA+4mu5b9dRm/mhkMGz9ItC7MC
         +BlFgWT83su8WutlNzZER8HdHZsPcukPC1jXcEx4dy50LCgVoGDVke7X1VhUraFpbGTM
         ela7dR8xEuyAFeUmBHNVlU81b0BwbPJqPuTQBTryXNm5ObcGsIKfMjcxkuHICjCoSg45
         MXH3WcJ/M/6nVYPRwAaKwoiQhDGgUkc+W6PWdsdNPYc622yBpfkmEcolH6mv0aiAD4Pi
         uxdYunorg7nq/NDgDPmydZ8saGiK+a1ElX/nz701pD4aCgYhfwiACNcXem6e6WgT/mCJ
         hXbg==
X-Gm-Message-State: AOJu0YxzdIJ4LTx7cHiFAuZDrk0l5qW9vPO8JDc5g2UpYZLJl8iGUajK
	TWOYTojy2YRzQAtVHDfSLFCUMeljjemlYU/hVcC4yBfJdCEKX13s/L8o
X-Gm-Gg: AfdE7clXhcBF4u/Tau+nOwYXL+seiZLKq14b3rxyZ4UMMqkDDz4w1KLlVJQoQg5DfoP
	t4ppMzjPXV1Hi2oe18c0uKGE0cAF5DX7LTfWxc/0hiINnrFVDowLfOlS8iXtjJG0ibYKhp/00SX
	aE9cLixTYKufMOU363CZTjI7A1GJv3yzkpzTIi95uNQEYl5yGll5RiDP4oY5WXM0yCiG+476eQe
	l/648+AOYyVqJZcsckq3lR6AMJa4PI4aviXioaCD8YSwCdEsxLLG9tAk9kLvko28C436MwM2lFU
	TgjC+9wTfoG6tV26DmzD27X8Qo038bDoFLwFxet1ktVcyc1mnk0vVgkJeJPQLlLOjy2fsq1ZKpR
	zdxXim9ObHsjZw27DPt9O69f6UNWrz4lT3fX7/I0Yc/ebvRE5zepBDn8WUDdw6t+RMNzZWtQ2Ph
	iR91ULq2Qyb8H2SU5sEbiz19GdJtFQibdNQezCw5Fejwxuexcw03qRb7x9LmZtw+oUQp2opJgxt
	gvb7SJOL6WidCHD25C0t/i+iVLuGkirgg7lbTKp+u8AiUHlhAItXEeNf7nZ0gDTXr/47Kn+JTM=
X-Received: by 2002:a17:903:17c7:b0:2ce:e747:c5d4 with SMTP id d9443c01a7336-2cee747c649mr27101265ad.46.1784010531885;
        Mon, 13 Jul 2026 23:28:51 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:14 +1000
Subject: [PATCH v2 07/12] arm64: dts: apple: t8112: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-7-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=uEOX/VWb2IzaqOqmoZJ5LrpiOfc1OnKwSpPs8c3o0oI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xntfl1++Gx/cdpDy/4Lqe7P/HrcQ+dkFm9dumDjH
 73ZbrerOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOdVc7IcDQ98Uj5oxkh8UuuKh6NmLf+gtqSwzP2bPX3stjE25Vi08/IMPfUKpH
 4VEfHp9PrQg9frn554/RM85uZaxcJtbEyrPHP5AIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index a3241c816c26..ec248ca052cb 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -1289,3 +1289,4 @@ port03: pci@3,0 {
 };
 
 #include "t8112-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0

