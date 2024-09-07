Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113CE208D7
	for <asahi@lists.linux.dev>; Sat,  7 Sep 2024 11:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725707691; cv=none; b=CoJB0U5f1u8xeoWH8AcAwK/If7BLZD3u/g6mb1sVE37wxdvd/Z3wb3OySTl7WQkzuxmJ31csenvMwjfoOo2xYwJg3cxByXmooAauRy3v/awhizJF3MD40HYKotLv3xLU7V35Slo46IGajcYthqCqHi7AX5qLtQpXWGy7tgTSw9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725707691; c=relaxed/simple;
	bh=CMbPPbLNgy/m8UF1G8Q+fRyhtoggVjJ/GN50xwDHbGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mab9wN6w9PuzTWNDcVM0HLpRtikZBOuie5B/m3HS9EzAVPzscG7jSWnDKjsSd1ZFgYyjaUKz5+xQY/UGVYf3KWfvbckFM8kxzX61NJYkdyNigyLOCVlbTtJy6zNPaBLlfI/KokpaaPs5djeaayj/8+Q1wepP0qpxcT7cWI3K8pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoB82j05; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoB82j05"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso2169323a12.0
        for <asahi@lists.linux.dev>; Sat, 07 Sep 2024 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725707689; x=1726312489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MKR2MN+/NUaZxZIfTkNVZ56kkqFXX80mnZeMHh4iTEs=;
        b=HoB82j05Ei/G0Mcbh4VaDwCzlGLGgW5/2aZJ6gJvXyfrrrtNqE8SO/m+pXSI26Llk9
         4tdQBqzNr9/XNeIh4ebnAETxO3R+lEsGKaVEHJ41JbeTbp3RCJI08O9xgHCexETFRGnW
         0RzxHavyqb8ellIZROz/uIamGwg7nQAnYnRAq6T/cs/GMCOJmvxeEvEqLbs6e3G8vTAi
         KrTQdEJDrNr1OMuPdFci7yKWSM0Q7gEg4Yo+I4CbdKcFLW58STGSY24A32oCIJohgCcA
         t1Dgm3ddZFngRE21O5uffBTVhrMeaoYruKnmH5b7gXESbgHXyXKxzhkVjupmmRxoGAx0
         LWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725707689; x=1726312489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKR2MN+/NUaZxZIfTkNVZ56kkqFXX80mnZeMHh4iTEs=;
        b=BsKAuMySgA3pulpbilAQ84ipy3sLq+iUemEatFvyL+k4zZfKHd0992rNwf7zLgOBqx
         vMQxrJOdPz8CQ/8y3Ei/bTpl4UzSF8NYhwwxYFDT4RFHI5haSR0C8dQ4gJQLB521dWLY
         eHnFfwJQBTH0cE3tOG1VdWPRAMDJK2EK/6vQ/h36aR63CaAVy9ttNYZTHPbfhrE1KGlL
         dvKZQShnAb7d0UA9iy0lN98ngQU1FV0j9Pt2co4T1R5iJuDfXkMWIv6nGhuIbRcWjMM+
         rMD7u565aFLHOUkXGxF+UEwrLrgPuXjyae9PW4kZIaoRG3smGHh/LDKmqEuz42YRSnHJ
         /OaQ==
X-Gm-Message-State: AOJu0YwFdoEyy6M4Ewa0bUvI8/WAhGtNQMB1pOwPOnJAcRABpSMHRiCd
	VQBZHS0wjocyqBVW57Ks5cxAmXTx+c5YKDcODEzgbIr9at9UyBMP
X-Google-Smtp-Source: AGHT+IEVgpMhIznnZffwI8DGtxdM5a4u1Tgb2XXQnWibOIoCrdJztBLvI3V7Zkjt9HqU+ZMPtzePiQ==
X-Received: by 2002:a17:903:124d:b0:206:99a8:526c with SMTP id d9443c01a7336-2070c196865mr33981715ad.41.1725707689216;
        Sat, 07 Sep 2024 04:14:49 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20710e1addbsm7186955ad.58.2024.09.07.04.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 04:14:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: asahi@lists.linux.dev,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/2] tty: serial: samsung: Serial fixes for Apple A7-A11 SoCs
Date: Sat,  7 Sep 2024 19:06:43 +0800
Message-ID: <20240907111431.2970-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes issues with serial on A7-A11 SoCs. The changes do not
seem to affect existing M1 and up users so they can be applied
unconditionally.

Firstly, these SoCs require 32-bit writes on the serial port. This only
manifested in earlycon as reg-io-width in device tree is consulted for
normal serial writes.

Secondly, A7-A9 SoCs seems to use different bits for RXTO and RXTO
enable. Accessing these bits in addition to the original RXTO and RXTO
enable bits will allow serial rx to work correctly on those SoCs.

Nick Chan

---

Nick Chan (2):
  tty: serial: samsung: Fix A7-A11 serial earlycon SError
  tty: serial: samsung: Fix serial rx on Apple A7-A9

 drivers/tty/serial/samsung_tty.c | 23 ++++++++++++++++-------
 include/linux/serial_s3c.h       | 18 +++++++++++-------
 2 files changed, 27 insertions(+), 14 deletions(-)


base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
-- 
2.46.0

