Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5F61BD4F7
	for <asahi@lists.linux.dev>; Mon, 15 Sep 2025 01:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757901131; cv=none; b=UJhAHTxoTUgCVXK7SpX65abv32WlMQch9Z573RHf+0nDlEExZR5aB48KtD66GXZycEVJhFV61Hk+ht5TvEaGCMggPrG0ylBno98Vv0ePNFCdydWpGWjF5rvAPeFloh4ajU7eZUJb5pd1FyBiKluXBNlkB+DBqhp1yFVvcDzYWaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757901131; c=relaxed/simple;
	bh=nEV1xIt3tWltM6HcFTPL9++suMELB5ydP0fIn7qC2Sw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k7A0xctvmFM7WpgFxJmf1UpYgbKEMs6NnyYM5NqGECnU6RICi0kgAe6WoYD64Hk8DJ8ZalFIhmKVSovUKBZ65eQU8VuXuvMdKsSr5mGBPaGJ2OdWWeJxTWGdqNHrgBJTf1di++aeU9CQ3h6pjG/AepmmMwejTsEZxiXgwCqmc0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elGhMb3N; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elGhMb3N"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so2988628a91.2
        for <asahi@lists.linux.dev>; Sun, 14 Sep 2025 18:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901129; x=1758505929; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mi+Q3MX+Nh87QtdSLZzXC7Ij30Ba/l8ZeRTlSODhCu8=;
        b=elGhMb3NNVW2AQWFR+9CnnR8U9A5f+2FqrOym+SRejDwB8U5Fn4Vy9kME6nkCabsv/
         W++2y51CFBYdehd+jQXwpW7Mnp3HWjTCB8XDLm+0INtSdLG3Q5IMOvI27VRKeYGj7XcB
         rTjl/v/z45qF/toOpeLrVvwNvB94EVvmSQz+aspldNBagH3Akp6m6oEcGI9/ILW2rJWU
         cJ5wtFEfJLuh0FhohMTRxc92K95PFTty1V1nTrkXS2+P7el3KofLO9mW+dDhJmMMLcZw
         mGlr6iQpzW4wyuoJD5z1SUJQU9H5rdvotmZBaUYs4PoFfxFeR89aRpT7PHkwVhrh9m2x
         4puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901129; x=1758505929;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi+Q3MX+Nh87QtdSLZzXC7Ij30Ba/l8ZeRTlSODhCu8=;
        b=cXIYMEq/0IanYs14/2mGUrehYXsA/Kkyl7tpuJLSva+F9JxktXkwKHnL/LESvxVMyv
         wBXaBEc8qbM2EE18xQ7om37zLvK2y1Vm8Cnm+RQt819ebSOMudOiOXjTuZy9SXxZMG+0
         KhiCp6TzMpUWTfmuJ+K3LH8fXKVSbd4IQNe9DTGoq+nNNXxSxGmmPTwASWeaOdq5jjtL
         9LVHPgDx8hp8zNCGS0Ko8AE3tQLpGHMluZ+hvHoqTx1bIwMI5oMP3Az1xLshYnv5Is0R
         Pv+8Lp/xqCEGGMTj6wFw7shIvVEsRQbo734/ldfz4np/1gg0rTfeILduHse+leNHLk9H
         xRIQ==
X-Gm-Message-State: AOJu0YxSvNSZzsXx9DI1vrJoaWKnmX8hx/pnOQsTQ6ox35Jx312wiNhu
	EWL9jjmAUrJLdIXbqaJw8P/EYgWEtvPjSJL2qLydRplWMP3cNhowsFEL
X-Gm-Gg: ASbGnctfXDKbBVt97n8rp5/Ma8MykZ1J4RyG1Uf0BKJVyOdmqQgCnAd2tK6CxXLzu6u
	4rhIbt6dTT7KhWigTIDmTcm+qRPc0c4jq60r1stkyde9zHqzVWYbQ/GzjvcKM2V9Ln6Up13EOXd
	DcuRoukonRlQmGhyEGuVyY8hZbfn/nBxxYftEXO2G9X0LWxJBI0SchuD/Lc0WBIidk12UD2alfT
	/9cY149vDWiXEKEUJOGw/jmJODFROcPQeZBNhLzw9FZOWouJS1m8kKtmGSCkh/vM1nNbw9rNk7o
	XAUtXMTCSyy6omqBIvcWv36ESpG8ZX/cFikv/GN2T8zjPi7KgcddualWNJBtbUvhVquY31kJLKS
	ktOi9QImblmX384Y+Rt4kc45B
X-Google-Smtp-Source: AGHT+IHWF+AzJX+M1VdVgQWjvhWFRrfFx2K9ZCZ7H1PPT0SBPU/undvXo0rlDVawqZIzAu9ueFerMQ==
X-Received: by 2002:a17:90b:3b92:b0:32e:ae:8748 with SMTP id 98e67ed59e1d1-32e00ae8779mr8787581a91.5.1757901128968;
        Sun, 14 Sep 2025 18:52:08 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b54a387d0aesm10354491a12.31.2025.09.14.18.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:52:08 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND v3 0/5] SPMI dt-bindings and nodes for Apple A11 and
 T2 SoCs
Date: Mon, 15 Sep 2025 09:51:56 +0800
Message-Id: <20250915-t8015-spmi-v3-0-f1d51031a708@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nEV1xIt3tWltM6HcFTPL9++suMELB5ydP0fIn7qC2Sw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3FFf0q6xEhYxdTKU4qhOvp7PkOYLr0XN5DMF
 VdVILtp4++JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdxRQAKCRABygi3psUI
 JPHUD/9UxVZqOz2cw72C5eSRIZTzEUA0p0te6QP9znCqu82I2RjHH+BwYf23Eko69k79/DGuSbs
 FGUBwP32VuCgenwa7IWruwwLWB8pm66q7jR01mXpnr9lwhUDo70LWRoEVnDYLNmp6n6MZu4knDZ
 WxYX+iZmOVrmeKQjB61WMdhrd9iDFLooUSmnZID6v6on9rJjUFNy56qnzjOyy6LaDK4R7G0dCPr
 l0VCegDEartwKOdK4VComtg62wUPBI38/T0yUysheJECDXvR8UROAHn/nLnhiz6PdexdahzsjGC
 fB8/eTuhdRp1nMoxIffl1Y9k8w/FOFS2CcF/8VsWIK9rpSvcLfbDZBPD1llb43BA5Ik7LkGsw85
 E0LJYrSaxdLrEhITZi4Ujqm206j9C7B1tc9YU9mBoeYaH2ulcmYcONcOz2bhK0ulLoGLvhjobBI
 oQDdnASJPWbPnVkCnIVWnaJV95iit9pqXzQ3dej5cSnmx28rYtch22kRUR57ThpquBY8j60AW+m
 PK4lV1doEGExtWpocejgmPM+wariey7WeA9CY+pmaGQM7naIKdkfE0ckvj8MflOFYud2QUrggCX
 Uit4pCRosgsiymjHL3S4aeaORsMMyRlfpSibdJSOVGAsRRnEqAx6u3yHQ+1P/XptGoz68zZ+r12
 aiptbgtn0ThVX+w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Hi,

This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
and the existing driver appears to be compatible. Drivers for the attached
Dialog DA2422 and DA2449 PMICs will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v3:
- After discussion with the DT maintainers we agreed not to extend the
  generic compatible[1]. Change the series to the agreed-upon style.
- Now depends on a patch[2] adding the t602x spmi compatible.
- Link to v2: https://lore.kernel.org/r/20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
[2]: https://lore.kernel.org/asahi/20250828-dt-apple-t6020-v1-22-507ba4c4b98e@jannau.net/

Changes in v2:
- Rebased on top of v6.17-rc1
- Collect Rob and Sven's tags
- Link to v1: https://lore.kernel.org/r/20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com

---
Nick Chan (3):
      dt-bindings: spmi: Add Apple A11 and T2 compatible
      arm64: dts: apple: t8012: Add SPMI node
      arm64: dts: apple: t8015: Add SPMI node

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 6 ++++--
 arch/arm64/boot/dts/apple/t8012.dtsi                   | 8 ++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi                   | 8 ++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20250527-t8015-spmi-838bb49d34ae
prerequisite-patch-id: 801a5b0bb76e74553fd30469734e9589acc09b7f
prerequisite-patch-id: 371cd14886cc2c5d6f6e8f8eac41f710b26c403a

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

