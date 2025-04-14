Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2C62B9CF
	for <asahi@lists.linux.dev>; Mon, 14 Apr 2025 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625646; cv=none; b=FwEGdhNJYAfzXO/4HBnxLlTHEt7jaV6ONCZt7/U9guf/619KPbaDlPrJiLU/Q2Cv91+zMDlxYHa6yCKHSwwd9eENCQJHNJ7s5ljFUrHmE7abJqLfIzi6P9C3TINEV7RBedLmwu4KKbh5lCQR37fRj2RsYG9PoORtcqqzt/TgAxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625646; c=relaxed/simple;
	bh=5NV1TH2xrxHb4IO9SixFXKNVM4OWlBJPXwuyr+sXUuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccOHSDDGMFMvgbOU8eFs6X1JpA/Gi7BhECEC4Ncv1hyDFMLwIiENEMFsOAYysEfF2FJVxBPGlmfBnMBHOPXIIaIa211geCukuOtLQSV8l2TJSGrQAA6WBI76Pz5peti+l+JlPgWCgMjxGfRAAp/7eWLNIpA8sgnztt3SrUwGAZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JXUXgQ14; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JXUXgQ14"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2295d78b433so41089455ad.2
        for <asahi@lists.linux.dev>; Mon, 14 Apr 2025 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744625643; x=1745230443; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Smsg72GcXkF+Ivv2bDXZHVMpQJJmZfbh7twUx1di6OI=;
        b=JXUXgQ14h+LcEL557H6RxjA5hNd5B6wW8hwWCWnMexZzJ7gdQGmsUAUGe8ae+WJb2+
         mDAlbdhGFZvHvt1z3J+XBqErdcL0QAeCJyzIV7YFAFMo/qpLtoEXOKW7Ig1kPylfWkrX
         W5xdHzGgU6g7SWW5KIZGhuZp0kherHNP/l1M5yxqBRu6hJSNnrUqc6uqVQ47QMr/klcm
         8AjzRzfIu+uGJcWkNxhobwDfBTtWE89zPKhFm2tGBTmH/GYpvqnx+9Qtpu90WuKB6oJW
         TxoXeAhNZK0kbqQrNz2aU0cLxmOdUZzBQLUNMFrrRs37WjdqOpt550LmJw9ENJXgAOuH
         83Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625643; x=1745230443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Smsg72GcXkF+Ivv2bDXZHVMpQJJmZfbh7twUx1di6OI=;
        b=qUNqfwMiBAwVsWAGX9rBH0oYTN9e3QZxNdX34PBMXdoTCyXrLRqTsvD/x8l2TtTHoh
         AV4aojwx413wu2SFJwq6IOshj7kHhwAeE6C0MomHl9MajwTntclRy5/aQErqQNU2nDMn
         LEGeREvJYhR+YD7xev3wBe6MjdxY2G3+qM17aX4pFIEp4Kl7giaS8+8B54IIZbjZDI5s
         PE7OP911f02NrUKb9PrLqv+e/aVBKzCzF0tLBHaV+Mer3TavjDo1rDaQ5RiQ1Ur8ZmMO
         n+xPY8pdC48fZyAkENqvBNxnm3Git5sG8Z1C7yjUXLSAbJvjdja9orpa6sZ5rmODFOwx
         hr7g==
X-Forwarded-Encrypted: i=1; AJvYcCX8+5tjGA/tdXwkjILOCEsRdaUR2ad9jhrgVhis7+2Iu/6gfLAPxDdGrTyjJmEPpzvIfFncPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxC0pyFJ92peqZ3SAsykdIVK69/43GugGIBRwNfpkNvAQKSZNm9
	/t8rqB1IrgjLPpB75KvYJd2GMcUVF/mXY8/yiJttGjfIQU4CPC78HO96ci39kQ==
X-Gm-Gg: ASbGncuEDRBvFD8FduhaqrH9IowHeRG8GTRUb4SpK2v5ZSirwwzhQQEhvDpO7dqao27
	+X61yW+hHOCRw5HL/f1w0Fxuv9mHsVHOBxiODjmBBzha5rmO1YXbUbwpkXAxnU+sdNq+4eflZI4
	PSiqd0FCvDGzMU9UskcUjILhtGIFv+16ZWm2Omo3izBoiJ+ujdIKC/Hz6JkFF/JxieN7GO8rhOf
	Fvticu8JJOBPyv3XeN9Ln+LVi+8IdG5PpIaovSC3Wzz24BpCp+8CKnUkvxiW4AqSHjvnF6h+fi4
	VGs4q/xVRyVNmLPAtRnlR6Fe1f7D3BEjwOIi9EwscQQ+AMn3xsfbaw0vrB/xbjg=
X-Google-Smtp-Source: AGHT+IFP91KCL2ubggimJjnRS6FXpsDpAY6dmmHmoDGSKCTanmBivzBpL+STAELx6GokUH9JL1EV7Q==
X-Received: by 2002:a17:903:244d:b0:224:93e:b5d7 with SMTP id d9443c01a7336-22bea4f6649mr164638455ad.34.1744625643547;
        Mon, 14 Apr 2025 03:14:03 -0700 (PDT)
Received: from thinkpad ([120.56.202.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93addsm95066555ad.152.2025.04.14.03.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:14:03 -0700 (PDT)
Date: Mon, 14 Apr 2025 15:43:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 01/13] PCI: apple: Set only available ports up
Message-ID: <egu73pd5m4ubr5ex26kw5vwtmekuto73x46lzzmc3gy2rkiv5m@wjat4ewfsud2>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-2-maz@kernel.org>
 <k3wj3wkk3cymyacboalkhe2fa7jvkpuehq4knpsouoyhvoavpl@bafg4oakp4lr>
 <87v7r7ygq0.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7r7ygq0.wl-maz@kernel.org>

On Sun, Apr 13, 2025 at 09:00:23PM +0100, Marc Zyngier wrote:
> On Sun, 13 Apr 2025 17:57:35 +0100,
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > 
> > On Tue, Apr 01, 2025 at 10:17:01AM +0100, Marc Zyngier wrote:
> > > From: Janne Grunau <j@jannau.net>
> > > 
> > > Iterating over disabled ports results in of_irq_parse_raw() parsing
> > > the wrong "interrupt-map" entries, as it takes the status of the node
> > 
> > 'as it doesn't take account'?
> > 
> > > into account.
> 
> No, I really mean it in the positive form. of_irq_parse_raw() checks
> of_device_is_available(), and gets really confused if walking from a
> disabled port. You end up with the interrupt for the next *available*
> port, and everything goes pear shaped from then onwards.
> 

Ah okay. 

> So IMO "as it takes into account" describes pretty accurately the
> situation.
> 

Thanks for the clarification.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
