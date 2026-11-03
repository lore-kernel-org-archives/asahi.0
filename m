Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681234;
	b=LVMxerNUxiaDEom35zpOeg+QdaEomzuxpkVYkKguHCwski+QXb/AR99SxV4EcNFNlXB+
	 2Mu4XzVYkRCc+p9kkdqSgoJ+h8wqL4TnlA1pjnsurdy03/iTLFbDVCDu29LnPk10IFuSA
	 swKykilGT4V2mUf47n8P9BusIj2zHCPqbibXJFWUubUy5EW3GwuTZ0BpBrgeQTfxmmxqe
	 bg+077zU8Z+/iIm4nc588UQmEMJKtNR6AcXzGQPNPfiJC+E2Ati4q9xzEuc11hk7xZ8On
	 lT833lcevdg/g/Ev1KQPGxwYgTHau/VBlx+W+3OLiIijx/iv027AVBTrjz+JE5zym4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TcyaLHkkCUFFThAgS7XPoF0D4DJks2eSDppGrJXvVV8=;
	b=VO01elFXDFMIIruzkmCx3f2AmhWM3auYH5Qhj7WSci8eW+Q6Y4d75qLQzQJBLNt0rHnq
	 p5yjQqn0RW13a67ENp39jS2ilLx2HpZL7oLEykKVr0n8g6uv+ncu57KTCd7Dnk4WeBzMO
	 7xbbhzGgLgCYhkqud0HSHRkgn1PrcW0b38m9Ei8WoP8Itf7ko8URPASFz6pKfX9aA1lYP
	 nriirulZa510dhOydS977P/2GgfqEA2kbIhJXGAEbX4536yef+iisNIiSZGPhhBgerpqF
	 kUQYmHB1olJQzbmYsOcF6azG/8xCnda0OGq+aXgXJ551Yc7fNVbAIpf8QYi8Iufg39Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5pUrFb1;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCF8606A324
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 04:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FCF8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5pUrFb1
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so7794371eec.1
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 20:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681233; x=1794286033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcyaLHkkCUFFThAgS7XPoF0D4DJks2eSDppGrJXvVV8=;
        b=l5pUrFb16v5GxzRoh4y+y5vEJPKxWovTv7DP3LUK0JZeUrx3P4JyOrD0nH1zJNEKCT
         8zdUNoIEjS+0bmpL1pd4r7BjWJ+eyLhWWUpJOCX3IN+v6xibcnz70EWYJYmWhn1q0o19
         CbhyZwvRZKugasZURFEFqYcx0r6JmViSI4yf1WeHL5y3h6KA9VTmvp5lYjDYitHGlSDb
         JfqusD7H6Qvq4x80U2R2HXzvR6FrhEB6+l3iSRBwtFgn3KvosAdT1+Z3gTOfkCwqTdjp
         h3eK6GBOkGjfs0mUaJAQ4u0nzJZA9V1Ozc5hY9tDo+eyKxvBNgfMPW7AJiN7aHl1EiDL
         TfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681233; x=1794286033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcyaLHkkCUFFThAgS7XPoF0D4DJks2eSDppGrJXvVV8=;
        b=LwX02usSE/b1TqLc9Xd7gxMY2S1SjmsQnZG4KLDVl6D7KAmsDrQfPXmPOWG0j7LrW5
         D7IMXX+nH/wT/bgzFxvdHd51iaO+hbeXAa3aG5oedIrHZsfoOkEg4Q+uPVFmFILxV74k
         0kjiu/cAN2yerhYA/IgLc6WKs9Tu8WhSpEXKRkT+JV7uIeQq8CHt+r5P+vp8/YWIkUNW
         4eI+yo22YiHzRciPCfvb2gVtSKKc77h5r5fKAtSeeSBETIalCbKy0cNIDexVCqq9ArW5
         lsDWcSonZXo9TUJxxcJ1J6jdaskPTr3hTcZzcloOIK14aMK4RWatFcCbdBRFZTp/FoQL
         9B8w==
X-Forwarded-Encrypted: i=1; AKwUvBwD9v+zgStAkQLeEMyoq2G8WX9A6Ovjr93Vd/ZukH6hqJeaUx+CQpQlD/KtkLndGc9p+XmG/w==@lists.linux.dev
X-Gm-Message-State: AFq9FYK+WdRNVaY5wiQBXC4VS5VTmtbG/YVUtMZ9jl+MOhGS7KWflQaU
	3O7/EQJr/3GrxZ0H8JyJPCHHhm9jD6+tKiqPjuSlt6ptI3uHPaY71ACz
X-Gm-Gg: AYBFou1a0AGMYk9jDdBXmhUfQHXsR1oH8l55hAGMNJdMz2BpnrmIzMugE+gQ0vbPI49
	PjEu8VT8LXXrTxEB5ZJmu+Oye4AbcmoVtSXCdF5iIbkk3FcQZIUp2n/LO4+EUA+/QihXS/R4Fjh
	mUHyi+iH77ARxJ4TiacptfaL+toHjMlt3GAYIoh0CagFYoXkXOuBpO8JpUZw1wW9YB4UGw2KxaH
	fGK6jojB06Hsm8/zAYwKqHYcMOvvKXZhrY80BGIhKa3FZaBr1H5DxUY+TqMshTdodglR0v2iG4V
	0w+fzErEZuy4cOOlfxM+hrJCQEJnhhDTW0Dxidd3SG/RmScra6yV8INy0ac2X+E51HX12HBCkJp
	bOqrGIcf8b5ORPtf4NXYPKnibVCScf1IWBcfif8jEpGNio6sgibj86M5LE4Dcq705Y737Vit9Ag
	DvRcwB+eicdOezZq38o/NrKRDTaWxgg2i6L8++aujZdyIuZhhWo6mtpSGYJaph0DvgyHMnfb/Za
	t6FhJkevq4ofXQm2U5/7EWWboEfBPaFWrVQVpO3TYOsOvd51jDwSjy9GZvOJrYeF3ynD4GEaZL+
	v1+uojmtvH94StPbed5H01XKmlnJ+/EaB4xNeqaQzaMeiVd2h3sK7NXfLD4vuJljjctVTkhfQeB
	m0eiK7wkfLNOHop3t47Q3wI2oOFG+miLd0l+qzg==
X-Received: by 2002:a05:7300:7a83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36a42362460mr17331914eec.10.1793681233040;
        Mon, 02 Nov 2026 20:47:13 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:12 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Input: touchscreen - parse touchscreen-x-mm and touchscreen-y-mm properties
Date: Mon,  2 Nov 2026 20:47:03 -0800
Message-ID: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The common touchscreen device tree binding documents touchscreen-x-mm
and touchscreen-y-mm to specify the physical dimensions of the touch
surface, which userspace uses via axis resolution (units/mm) for gesture
scaling and palm rejection. However, touchscreen_parse_properties() has
not been parsing these properties.

This series teaches touchscreen_parse_properties() to read
touchscreen-x-mm and touchscreen-y-mm and calculate the corresponding X
and Y axis resolutions from the configured axis ranges, accompanied by
KUnit tests.

It also updates wacom_w9000 to drop its manual parsing of these
properties, and adjusts goodix-berlin and apple_z2 to set their fallback
resolutions before calling touchscreen_parse_properties() so firmware-
provided dimensions can override the defaults instead of being
clobbered.

Dmitry Torokhov (4):
  Input: touchscreen - parse touchscreen-x-mm and touchscreen-y-mm
  Input: wacom_w9000 - rely on touchscreen_parse_properties() for
    resolution
  Input: goodix-berlin - set default resolution before parsing
    properties
  Input: apple_z2 - set default resolution before parsing properties

 drivers/input/tests/Makefile                  |   1 +
 drivers/input/tests/touchscreen_test.c        | 209 ++++++++++++++++++
 drivers/input/touchscreen.c                   |  18 +-
 drivers/input/touchscreen/apple_z2.c          |   2 +-
 .../input/touchscreen/goodix_berlin_core.c    |   4 +-
 drivers/input/touchscreen/wacom_w9000.c       |  10 -
 6 files changed, 226 insertions(+), 18 deletions(-)
 create mode 100644 drivers/input/tests/touchscreen_test.c

-- 
2.56.0.385.gac671c819a-goog

