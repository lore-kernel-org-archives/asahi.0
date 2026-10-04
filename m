Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEE241611D
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107142; cv=none; b=RF/BrjwdTWlU69IeiWM+QNw6B8NrKYIiQgE15XT6h9Tjp/yNrXDblu92FhnJoP1idiE8KiFuNLyzIB1RGAj/ZWfZmCHsy5pTQy+2eYUrCB0SJfg41TISj5gF4dFDPVTeesgJYI+KUjpcRH6TqL0kEOQg/zLssPPuDkw30aLsHRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107142; c=relaxed/simple;
	bh=uSpJlr9pWB8cp8BrFmQO5ngregHs2jVsmD4SjTxJsbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4WzauQrE1S6H/Yoq8jpgj5PTuojQA24xl1lnV1FxFR9ctngWubSr214uejcVDcJYSiRZr9e/fdqScbMimgNpZXcZlCEByGlMEDrRSFWDHpM/JUx7/jV/Vbtj4PS87IppxJoyG9egO2n9PYSxgB3OVNEEIR8377+H9HoyVfhC7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=H/x0bRsb; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="H/x0bRsb"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-9196d8543cbso4458156d6.1
        for <asahi@lists.linux.dev>; Sun, 04 Oct 2026 02:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107136; x=1791711936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxK826MAOAYwXMvz4tvmAzJFT8E/SsdJVdTSWQcGqO8=;
        b=hhFgKPkhUscYER39pzOnDUN374qKC7igoZV6ZkksqmCTo5DdW16LhGMgOBtqLlqhe6
         scbMB5CNytyJc+V8Lvp932rBF82z7gxz5pvNsd7SdQjL2xp5MGq/0ArxcYn0y79qENe9
         vsyb2T6d2P9JQ+g73GJo0jN+fo9YuTwIaNhW16JCfDNFaUuZz+BDb74aAyobxZbzy/fz
         zSx72qIbclOFn29nkOoLOkLDR9E3TmDj6EFW7QyF7TpIWOjqIPVjZ85iwYAyYvVlnH9V
         lcg1lp3MOrCmHqYcytY9QRm6kOvLAdoYnT6BFUP50TUr/uW7E/sUaOXenPbYPDYNT3Dt
         f81Q==
X-Forwarded-Encrypted: i=1; AKwUvByAQdHTjjZH124fqsWYzaC+x1ayKFdyurUVFUhMt69SNvYtUqACYTDZ6lr4jN2Svod44jr3hw==@lists.linux.dev
X-Gm-Message-State: AFuF++mCQLCe/Qd3dPNqjSxcalUw1aPVR5B/HKoZCfYQ9Wl8/xuVPocq
	Pv5weaXtg2eoc/Qe/ZLO5oYn7QT5hNceb8zyg+Tg2XnJ1e+Ui8AzMjRQggZ/lhhug8jMCSe20iH
	2r2KBNbrzVOeoJZQYOyRLqr21Uq4mDwoIrO29bwCJ4vF+y8sN5BDi2dVWlQ2ty7+IU6i8iCGMP9
	oasZSuXsskz/d7W/VdCpKgWB30k3L7JKB7YBxLmKzVr4C6+uZ7yryIg//YN7T8R/WSREHw1QKbR
	OaoedlROVI+BLQ3
X-Gm-Gg: AYBFou15z87wHSLzH9WZJqz/W5Nfk4x7OdSWIKX6eGtVE0WJ8G+ibMRNHOHywbPVESi
	AUAYIw6lXQbnHtdIGhBqkTUq5leh2y4q306hXeA2fiCtXOYbPUpqCGWigioTvvDfGjQyLnzS7sX
	kWqXZ0bN8HRpbE0T+nzUlmVQ6Jxp96O/9Dm3Xhq7anjALCiONVtRezSgm0/mzcVxiOZGoopfvW1
	wY+yG4hYV0YCbop20pQlwI9lCL/j1Xzenph3tJ7B1dXk0Htk0q4lRqjOZAzjhZqKkd8M6nuy7e5
	U3InOuBlqlJbsAqpAneJtU0cvcAFF4ei/gCM9IgjGLjUegdg0EqhxS0WGEBG9txwPHNmrjq9gJ0
	YYSUuIe9Ff35kq6JoWxiqv6vtvWnJe394oGeCHoae3WJrqmMpKtmiPvtisYiFeq/cwmX1VerRr0
	AEHftNp/F3SdFrv4U9cTdjC8ssIpeah8deziD7nw8=
X-Received: by 2002:a05:620a:bd5:b0:939:feee:630 with SMTP id af79cd13be357-93e50ffc710mr741335185a.30.1791107135780;
        Sun, 04 Oct 2026 02:45:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93cca30e892sm292661385a.9.2026.10.04.02.45.34
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 02:45:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d80ca2184so1226399eec.0
        for <asahi@lists.linux.dev>; Sun, 04 Oct 2026 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791107134; x=1791711934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxK826MAOAYwXMvz4tvmAzJFT8E/SsdJVdTSWQcGqO8=;
        b=H/x0bRsbboFxhAnW8OZxr8NYtel5p1jvrZ3qcR9e/hV9xck32HAiB98wIfYkg8M8IF
         O0PaMv5SJ80DEhuO9B4bl3YJbEr8MW8cyrsk5GpG4sNQHtV6/Zw34HVWuih7DuYG484r
         WGZ7V8nQUQKRB7nfEQIjxsF17S86Uy094hHKg=
X-Forwarded-Encrypted: i=1; AKwUvBzDebIIGvZpGnFXY90OEJh2ZTCQ33oqlDx9YPoAzYS78UP5Izbw1bAKovZ+443WWCUqmH2PFw==@lists.linux.dev
X-Received: by 2002:a05:7300:d509:b0:351:23ce:992d with SMTP id 5a478bee46e88-35123cea7f7mr2847627eec.27.1791107133678;
        Sun, 04 Oct 2026 02:45:33 -0700 (PDT)
X-Received: by 2002:a05:7300:d509:b0:351:23ce:992d with SMTP id 5a478bee46e88-35123cea7f7mr2847594eec.27.1791107133106;
        Sun, 04 Oct 2026 02:45:33 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272f27dcsm3508030eec.30.2026.10.04.02.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:45:32 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Janne Grunau <j@jannau.net>
Cc: Hante Meuleman <meuleman@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	Jason Huang <jason.huang2@infineon.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: cfg80211: Report port_authorized for 4-way HS offload
Date: Sun,  4 Oct 2026 02:45:27 -0700
Message-ID: <20261004094527.1324037-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net>
References: <20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 15 Sep 2026 21:17:38 +0200, Janne Grunau wrote:
> Since commit 416386060 ("Mark authorization completed on driver
> indication during 4-way HS offload") [0] wpa_supplicant expects
> NL80211_CMD_PORT_AUTHORIZED to complete the authentication when the
> driver supports 4-way handshake offload.

[...]

> Cc: stable@vger.kernel.org
> Fixes: b8a64f0e96c2 ("brcmfmac: support 4-way handshake offloading for WPA/WPA2-PSK")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/cfg80211.c  | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
