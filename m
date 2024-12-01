Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9301D5CCD
	for <asahi@lists.linux.dev>; Sun,  1 Dec 2024 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733068846; cv=none; b=QsiLP72S28wn4Tp49YPXRwHWHfQNlEluokcE4qeLJvip9iS9+v0TdI2J007WUkb+WMlDh6RKUvyOaraNFtFXn4paBarJH1WfFAZgGPSGWvSdzGbzN7qmPuMtFQmwzHzxzfLRx8ziY90Ec7PEFb7XRqDLq/DVggQugFVuUJ9K9pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733068846; c=relaxed/simple;
	bh=GLduTRh+mc8PcL0g7Ssi4bKecwo5Rok5jKtZiwlOm8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7PlfrQQ4Ix2StjVC+8sS+N4dKNdhvM286B9yA0ihA5TpU6quSgeRofO13xU3Az0VBQoTHxuw3J4erIIQA4sNsLxQHJNYp4UmXycmQkmLXk52cac1p5FBLWBO8ZIEr6XrxwBQUQ5BbdYJLx632NajpA4tNWwDdVqTQtU7pTddc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH7XkNVf; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH7XkNVf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so1189086a91.3
        for <asahi@lists.linux.dev>; Sun, 01 Dec 2024 08:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733068844; x=1733673644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa5SS8TIm70D96W83i/T8FBfkF8phya3zla9FCJAKVY=;
        b=nH7XkNVfoPIfDE72HQbiD1YP1GEHVqaEDNTBJmn8Jy3WVpUsS6KAs9LGVo1jn8qJT7
         QnOuRtAEm8+akHTJBG9rFk2MD7wR9i7g7twrTei880RLEcajjy3RFql+pn5p0PCZIexp
         KUlQpn7kgSJWAc7eYDDIY58DwaitEB3F9bSAUMeXsPzuF3NdZIxhHqnYwp2NN2/rmBVY
         fdv0hAVZISjftJWgsrcSQAmRoZ5SgPl/CtxYwYbL7El/R99Sza6ImcC6SP1CLjaPEWzy
         7qxjbfyesUL0As/ZfB/l9I0NnUkc4ZfB2g9dRKu/89toghhVRgRZVkkHx5rQr524j2Wn
         yTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733068844; x=1733673644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa5SS8TIm70D96W83i/T8FBfkF8phya3zla9FCJAKVY=;
        b=mdRoeRVLtTML/wiJ7+61LcHQHnoEkdcbVvlQEOhsY8hFbuPu/mbGSJd+jVO8Gh7Uyj
         G7fhcG2rex36a381XMVeL4hyti8zq3NPGY91EnwxGkg8v6HU4+nw9mEfpWL8EYF0rooW
         rZLnsZMue3YcNX8Kw5hznsYInS94JL4zradgrG7VCtBg43EHdEyqt4NFygsaa1oOm3oM
         Kob6aiBjWszFATvxlPCz3zou2CXSmpQE9qd+uFHB3ywMmGxiWURBrVDIKf/u27GdYKCS
         hMNadnypkVgbqa+ZNhnMQCxRO/mrptJZ7v0Ec7VU+PDh9XrsBD4+CHaRUUvfjbVcIs0o
         PVGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnlFSdEmEDx6hTYWkNgnzLGUb2VnAnztb5bQopyyA6rvS1Qpd46RVmQk9SS6aQRcmEyXcfmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzT7tnZ0WZj0KD1sWjHL+/8MMs+kmPbuFvvi0TuDg3Lt7Qd7sVj
	U18+5Z1gIlCLshQ2nHB0VTHPRUfH1FUI2kbX5n6WyQvODNo6ka4w
X-Gm-Gg: ASbGncugnoVDAgQSARFbGh8Fs6tzxM+oaoRr/xAcVCCkGNWszCEoCWws8xmXGly6WLv
	q8j4lJ9dldhDH7/ps+gfQTzpvdmLTCH7KJAI0fV58VvOfMvDtZeIA6I5ctNSu18LpNBEfAa64aY
	FqiEChd4NX0usURpCl/6RrI8qrx7cPZcYZ1DRUju3UK87IRkzBJt5X2nata03OgtNSLe5V8vuTK
	XRPSg9B/xaQ6NYe0MojuRFP7bq88wRNL+C7Q7I67Xw0iFk0gAw5rmCUOopm34bknA==
X-Google-Smtp-Source: AGHT+IE67IoMhdkZhbCqGTTlL81j+rymuRthOI6+qz6dw9AZsphEAOs24hWrEsa0WM735TWFubxf5A==
X-Received: by 2002:a17:90b:1dc1:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2eed1871fc8mr15046a91.28.1733068844164;
        Sun, 01 Dec 2024 08:00:44 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee6ebc4a73sm2395173a91.0.2024.12.01.08.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:00:43 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Sun,  1 Dec 2024 23:56:38 +0800
Message-ID: <20241201155820.29259-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241201155820.29259-1-towinchenmi@gmail.com>
References: <20241201155820.29259-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.1

