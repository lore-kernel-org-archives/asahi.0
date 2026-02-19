Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9F633859B
	for <asahi@lists.linux.dev>; Thu, 19 Feb 2026 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506589; cv=none; b=LXpF97DyJgSyme6N/zzdzGSbJ6fFFAa5A5Rv/isOkVrRCh6A5QeoKOgT1BbB0ypSH+iL/DfqUJYeWqbC396DezAueW+UHAC4i9X/o0hF7MFuSOE+0Lm6GbAmFezXxI08fYmfsTgT0ebvvssdfSIm1J9X9sZeMSARrBnmyYwaz6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506589; c=relaxed/simple;
	bh=79yWENIeJiOI8eu1NM831bIc+LOdWu9bx+B4L/t5N4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hweyAyASUDmzi174eezXrycoEl9TMgDIFezolY9YWprEzPdB0f7eh7zMmxt42umlC1BH7XcuOwURZixk2g9mZkGdBeubFbZ82btIktow0CshcmQol48BIbeAupu+OR9AzDWIc/qfqzBXMV3pVHhsq2Bh9TP+23XHskbfiBrvx9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5gEUxk/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5gEUxk/"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so752168a91.3
        for <asahi@lists.linux.dev>; Thu, 19 Feb 2026 05:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771506588; x=1772111388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79yWENIeJiOI8eu1NM831bIc+LOdWu9bx+B4L/t5N4I=;
        b=B5gEUxk/J59GWGQggdWlbvCN0sPAEyWzDpwUryv1P6hLKdYUK3cqty4ga7871w/KYf
         zB+cUfz+xk/HyNAT95eRWah/YhW93UDICA2fo9WwLkTttYkGmxexezepJ4muyOPhJ/tG
         5S1V2EBNB7dFZQwQB3hP2l1Ip54MBL4U8cO8R4wXoFgu3wTJ+vID0TLJ/4+cERyVsU0o
         0VTq+6gAOWcRPSqSjzZhBiQ9jfCAD+IcRcNGSaHAyHVbvT0ISw8cFUCHxjGomXLbymdx
         8zBTyqSAYhAPe6W3poLKhvdSJRFqfg9LB79An5/8ukt3GZaEePDjebEg2y24NB+JI5jf
         zh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771506588; x=1772111388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79yWENIeJiOI8eu1NM831bIc+LOdWu9bx+B4L/t5N4I=;
        b=hXH0XXGm+RPfGi2+WBPRap/bow3HAVRRjVeDvN1KFIwEOLkcv0yhK5p94TYXqtug8I
         SLlnEP14XUgn2+PL40qCum1pQhb6SiKbwS8EhX6Whxmlz6mb64tDj/xm9hdvSUF5W4hc
         Fh7fZWChSI5b3McVcFpHQ8E3CmrzdSdcYmhdMM2RwYdSrnUrKpmihFovUHrou1oDP0x6
         D7MomZ/rQA0M1Vp5Snio1BncmI1O0shsbuV/1106xw4zvl+cPH5dZg4HBD/uQMTXouLj
         5wlbX7Dyd0phbxqEQFxnv9mJwOIGkv5m0IR0LFFl4/rl5VQN/7Ix3NFTEVOR3Wo0MM4j
         mAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRXREQTQ1Vhs1AZBRxClOPsv/uOY2e0aVwnNVPMJYB09q297neOrZ60vHq62nR7xgggbM3pg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAIOfkThMiFQKngMTCyhmew5MxOIYJDUSB/7KUegAHY0feQgmj
	0ajVNooVxqE+zexecxgXcxeUxu9MUnHei3PAM83drq+4ZpDsf8bZUk8U
X-Gm-Gg: AZuq6aJo3WpVXxKy8Q9mwtjTrCWsYJn7PR2TLgpQTCjWTfJSyJUKdeOUmP0/AMkP60j
	szQB2Cd2NXwRijgI+dqEq5hi7pEJoqL/N8lVML5OiDSSkerm0vqByrN43tOW074EtlCLdGOFatB
	6hzM2fKgIxBrJ/R+RLGwD7ComxwbYA/3zmrVSfGirctEk3TZ3jwGxsh+1UdPfV95T+I7h/Uzg14
	6oZ/qSGKPMV2sz+NaOoBBLJh2kLyDpUdh+WsQdNE8bEPRo6kWPT7IwT7vATe6rWbm3RuYHrtyIE
	LconeamlPrlIlfOCGHpdEIzi9PkzYTTS4GtWvIsGuj52ETBrKAT4qrECnCdJUeXVZm5EVX3NtY+
	4PEQzz8/CqCKEu4/mfUzblaYnVIOGZ4smQebnmRnaEOwlJ7jzuUvGNojRFGugx17bNRl4JrxeiJ
	ELzPEGfOFZfVOpfn3r9yqHvdzHkp6B5pAAEzI/L3w/42LFj2l1gsVyKP8BpUE/+3nbGwm1J2a6L
	TnEPi2W1o6oCj7mltiz4Anrriukp9m5Hph551NNrr+MWVYxB63nNDjhknFpkwHBKM9wnbLNvtdC
	HLf9jHFlzvAzBw==
X-Received: by 2002:a17:90b:5704:b0:356:4c1f:98d4 with SMTP id 98e67ed59e1d1-358890dda32mr4625746a91.13.1771506587903;
        Thu, 19 Feb 2026 05:09:47 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35896ee223dsm1319001a91.2.2026.02.19.05.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 05:09:47 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Tejun Heo <tj@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Vinod Koul <vkoul@kernel.org>,
 Pat Somaru <patso@likewhatevs.io>
Cc: Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pat Somaru <patso@likewhatevs.io>,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] dma: apple-admac: Convert from tasklet to BH workqueue
Date: Thu, 19 Feb 2026 23:09:41 +1000
Message-ID: <6224644.DvuYhMxLoT@minako>
In-Reply-To: <20260206221143.1261191-1-patso@likewhatevs.io>
References: <20260206221143.1261191-1-patso@likewhatevs.io>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi all,

On Saturday, 7 February 2026 8:11:43=E2=80=AFam Australian Eastern Standard=
 Time Pat=20
Somaru wrote:
> Convert apple-admac.c from tasklet to BH workqueue

Tested-by: James Calligeros <jcalligeros99@gmail.com>

Regards,
James


