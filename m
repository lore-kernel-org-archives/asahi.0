Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D661215178
	for <asahi@lists.linux.dev>; Wed, 22 Jan 2025 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567663; cv=none; b=VNOlnEWqfz/JXLtgts4kEndVi+OYvRVzsCd9BhrIHZhuGKrPP7ereylj901FRC66ixayEhEVlvvoTWa6TIIC5WNRwsa2fVAMIuD1AnOiqyII9v/Y+ZWPHERwNl+fT5qt902efPzF/kq+oT9tdLOPFX8OboVo6nSX/AJJZJbBZUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567663; c=relaxed/simple;
	bh=AruiYIPk0+P1omcUmBeZp7B+GTK+VH7y/+jM2mwR2lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nI3QSku8IQOyUe5AM7WW5EyzbugMjR4Sz+GFVZmmdf43rwh1qpXJqK7Tim2tINfzo1kH9C9J3SCEYuYssgAAsqftrT6AtIGKcl1q82mHxAE+J5DehaTq8Jf0CgAgL26IC/CGLIi7nQ+Pkw5/T7NbPKyHB8PrtEgmuNqRoL/jStY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+3QJVLc; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+3QJVLc"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e460717039fso3040276.0
        for <asahi@lists.linux.dev>; Wed, 22 Jan 2025 09:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737567661; x=1738172461; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1GtyY1cVaBALO0x9itDiGJGSMS4qefrx4wqmN5pEG4Q=;
        b=W+3QJVLcve7uSe70BjfvKWp8aZVxuLgTmQ++yQtxbVMKL2pfAKIuoCwcm7qI7GtKQG
         cW5HfXkuYwkjz8wnOKa1I3VxQjDNOsJma6CRsnok1tsLzmSbyYa2slTH7fk3HvuCxbol
         V6ije037z6zWwgWNGZ2/lCwJPUD5v7xVWCG5irUQV8hDKJRCSl2nz9P5ZtPkHv89b0g/
         socv60u3Zb81JhoSgcudATMHI8TWYnpRCfgqRx1pCcRUFsVEdFjI2zkmpa1TKv77dP1c
         voVqVdFuKeuDJfwIZzy8CwMnMnMP0gFP/R3e3ihDJZ1abvF9QZgYtaQGAITmgDwXVW0z
         0/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567661; x=1738172461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GtyY1cVaBALO0x9itDiGJGSMS4qefrx4wqmN5pEG4Q=;
        b=QjYcet5wCDCrT1sc2a4Um9iItAjNXWp1ZRHhHi4E9uyg8y4U1uk/ndZV7hkf4QIbwe
         FCoBqurD62XnMHNfDJZMnagz1pRkEGENh/HLhluBpUTEUjnj/ItvCPEAHKDH8vhBnXsF
         tzZB4b1PVaYTOp776zxcd+Kss+p+T9ivM24qG0qIFPVaLzOvb8uUc1ObWPRRpaYxhVm5
         Zz/zuF5WDUwPt2QfdP0U7mD24er7e4ggvhsrTlJQW2qvw7Wnj+K5vLNEF8Ezi+q+CWem
         uag56zvMKt4V9nxo8xsCxD3mlXrRU2nk3zRmq9pUrXsidB/Rxa/+s3NPqZNn8qYrqYrv
         sUkw==
X-Forwarded-Encrypted: i=1; AJvYcCUCTNaYOucS8IlkihA0ij/sA5pyW25Q/ic08q6DwXxz7VbFLd/c6m1GV0EBehh4b/KjnvgkhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxKkHzUorillFTRBq/TbXEGbsqiPPUQP1F+WE484m21QXX1KgC
	q/vrU6oRuoHN3IN2cIse9G0BlXq5WF6dPjcT41DAa+1NJZSmRPE/KU++D2yBL+WdlnEUSJccEal
	MoH+ZNyrPAUvlAQuOlRnHn0cWIa2sTHqp
X-Gm-Gg: ASbGncsi5rnIz5itrYCk0+/WX+FLdUrQJN8rulolu08AJvXxZG/F08gEkU/Or/DW0cc
	N+3t/cOzUdaXeo74/ZlvYGfVCW2Dd31iyjfhwkiMhC64x88Oxf/ad
X-Google-Smtp-Source: AGHT+IFd650glm13bU2UYBiJTAE5o7XErEbuE5bAZ5JZaThH06YEG78EurncTUvsjymmBNUVyUAlYia54MjS7SuCnQg=
X-Received: by 2002:a05:6902:10c7:b0:e57:6644:ea3f with SMTP id
 3f1490d57ef6-e57b1051acdmr14913763276.15.1737567661245; Wed, 22 Jan 2025
 09:41:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250118-z2-v5-0-6d38b2582169@gmail.com> <20250118-z2-v5-2-6d38b2582169@gmail.com>
 <Z5CNx9natNYmJ5il@google.com>
In-Reply-To: <Z5CNx9natNYmJ5il@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 22 Jan 2025 18:40:50 +0100
X-Gm-Features: AbW1kvYyP8Dx29asGtYcXu-mkX2Tn_inSrOkAaAFhCNj0HIYUTnNwU_fXtcLL2A
Message-ID: <CAMT+MTRKpgHBVVHoeWGmOqpF9vzZV3CTUdg4d0oOnutubeTFaQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jan 2025 at 07:18, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > +     z2->input_dev->phys = "apple_z2";
>
> Phys is supposed to be unique, however my understanding there could be 2
> devices in the system?

All existing devices have at most one z2 device, and while i do not
have visibility
into future apple product decisions, judging by the current stack, it seems
unlikely for them to make one that needs two of them.

> -static int apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, size_t cal_size, char *data)
> +/* Build calibration blob, caller is responsible for freeing the blob data. */

A comment on a previous version of this patch requested to not have functions
that require the caller to free the return value
https://lore.kernel.org/all/ZAlM2DzMmwzWIZEF@nixie71/
