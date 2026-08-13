Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36C43B0585
	for <asahi@lists.linux.dev>; Thu, 13 Aug 2026 18:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786646669; cv=none; b=iLBrU4EyZbBCbuogtmcIXug71PtWpcvh0KfV80GBxS9h+mBuONdbelCEwPgQK90mxIXYEl4KsZV5gbhfUovelFZvgvSov05LMAIXSyvt0Mx8CFgBfDwrLrYj2bTCRkhbXnToeIPhTE0swXml2OeXTMXeTxyfEbIMk/R9tliMx+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786646669; c=relaxed/simple;
	bh=8OjxNhHePidmg1fuKU7xo+rrS9JcoHVOhiq3oQjVaNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bb50r2aXWiEjyJR5wa+DLX/5S06RaIR+EEUFDwDj17EhpMcAanYZ6WDDGKHJiL2H8Vxca1YmqFYrnMIZKfRqxXWaJtGPItrzN3ydXENUylzmpNgorKgoBGPlYS1oJpxN8CbPS86ZpuN2M1sM0UD+CNOf3tRE0t4fR5aTwZ4hMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM3Swirr; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM3Swirr"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39dbe684115so10080051fa.1
        for <asahi@lists.linux.dev>; Thu, 13 Aug 2026 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786646666; x=1787251466; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OjxNhHePidmg1fuKU7xo+rrS9JcoHVOhiq3oQjVaNA=;
        b=NM3Swirr52eveki2zRM8/lhLMHJYV4dpoqFqbRUXhuf4HsJUc+VDxrVOj8hccmVbOv
         QY8m6cfoqsQtfXTYmFL8VPQKHA6UfHRtU+vfCkFGuU9WY/8TrC6YHd74AJis8DSPTiuR
         j/oPV/gODDUBUchyfq70jQU/ISLuJ/+npDbibqgNFIqfUZPLl9oC4/ZeNY873aJPDtqV
         cPmfHh1YyVk19sEoVF2ST4OmqWP9E0mV2alf4L+Fcq/8YQ9G8jfQeLKnttBd276SXD0s
         7fRwOvxbwy1FdNsqJwQ3Be0ePrRlECpQbS3hjTrJNST9bqWROY5FRW0BB1zfRXa98Gxi
         0GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786646666; x=1787251466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OjxNhHePidmg1fuKU7xo+rrS9JcoHVOhiq3oQjVaNA=;
        b=kztc7uPB6lc9M2TVIFR3O5kdAt0N5MVlRMy7TvZIQkkbYUVszshB3SSwgzMIdI/2EC
         PPK4fX5Xlcb0cxBzIcCJxJIwijKySAvu21duxYok1p9Dh9P5kLWIUIwlaWx8mg5tfjUZ
         nlh85FYbHoEzxn+3k+Xs00eHWek6Ecz6Bw24Yf2MsQAqUffhviGYBnDaV34lzPb6nAdR
         nFGFHWl6v+oF24NYJuPIU2hOuU50So8DtvYh42OfzMZ3emNtKeI48Xfsny2GD9fVsgsp
         fDVnChFWNUCqvRpJzxiJvp2biPSbOFD+BWbT0XgEARxqLId6BCPWKQVbYDljjxUoK06D
         ojhw==
X-Gm-Message-State: AOJu0YxgIApu7RCgabWTRrnNU/hscw7gm/5eKiABsYS93qKLPThjh2Q+
	owRgSG162rpwJ8TRh+K86GN9Hw/fN/7RgiZhs02jXmhU9kcnInyEGUM7
X-Gm-Gg: AR+sD10Qk4SK81ubTC1BPfJH9u5sxnLOFcE/laiOgokqaKbl9T93GfFdaS7/BHa4aB1
	N8+NUiX576DZnkXFrK0kqXhRQzVOa/FbbBth0olSj1treQqNgUmGJOsoPvuUGLWK9D9u4/msJFQ
	fTtVnMF0HA08j/q5+FmvLV/wfqmrf24Wg29+XnsO9ZZ4O5ce4x6BVYE+USjRXZhiOKX3n+xmjsC
	mjgz+IPdypPGLRMf3WzX2/7qjQs4oQoXiim1C6elzte38KN3IdR1qG3Ts/sNes/JLQykYbZibF0
	0sevx4o7JL8CgIohWq5xsEIG/zpyXZSEr64Rc/IjY36Ff/ZVlAdQc4X1Tc0uGEZIdGyqELe34BY
	eG8Taea3gxCBspk/P0qJwgyoOvzVpdaTptco+WTwZ47cc8/j9eiAXinz/8h3pS0f7sxT+qJc3a1
	Rb7P0DtjUIYxplKIA13eNGrvjD30omy8VvWr0ON6Ui/yeiKxPHUwPsUNY3clucf2SlXD97SD6+P
	tZJwAT1+5BY/4TlRb6E/q397OfjWriL3knsoTmzKG1fMY1SemX2
X-Received: by 2002:a2e:bd12:0:b0:39f:af21:75d7 with SMTP id 38308e7fff4ca-3a11b9206d7mr11997201fa.2.1786646665697;
        Thu, 13 Aug 2026 11:44:25 -0700 (PDT)
Received: from XPS-15.tail097737.ts.net ([178.81.193.36])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130cfa1dcsm1187621fa.28.2026.08.13.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 11:44:24 -0700 (PDT)
From: rafayahmed317 <ahmedrafay888@gmail.com>
X-Google-Original-From: rafayahmed317 <85213825+rafayahmed317@users.noreply.github.com>
To: sven@kernel.org
Cc: asahi@lists.linux.dev,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	neal@gompa.dev,
	stable@vger.kernel.org,
	Rafay <ahmedrafay888@gmail.com>
Subject: Re: [PATCH] usb: typec: tipd: fix VDO handling
Date: Thu, 13 Aug 2026 21:43:13 +0300
Message-ID: <20260813184313.405826-1-85213825+rafayahmed317@users.noreply.github.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813-b4-tipd-vdo-fix-v1-1-70317f2cd554@kernel.org>
References: <20260813-b4-tipd-vdo-fix-v1-1-70317f2cd554@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Rafay <ahmedrafay888@gmail.com>
