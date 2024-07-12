Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BBB172BDC
	for <asahi@lists.linux.dev>; Fri, 12 Jul 2024 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720797163; cv=none; b=tHeh19m4RC+PqsCBnJqzXNw1weJLPFuBMO0ECR4EFT1kw2YPyf/MhzAjSp3AF/O9aD+WAHGyHIMwxvkpMJyMdK2CQqmJxAjx+sLFytoITH330Vm+k4VQXXA/OBIWED2dVH5XqReJV7shl5kIJK49NcG212Q9h5qNcWPU0/zMKn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720797163; c=relaxed/simple;
	bh=9Elco0jrI14dsSz5iWTmdNQrcLzKyx5FN7AKXrL7zxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv2Cm+qScnHDaEPx1kcq+2dJbdYbHB4NqrrYnMbbGJx+lD3xD5Z9o43cepP+QHiNpJkZJNQY/PUbtYlRIBXh6BZ6po+9d0+dSOI/ODgqC1PfjgilG9JFXtTCk/MVqt0DdyJt1upSuSTepE4d9ZmMV0FcP4CQG4uIG2gnL9uxh3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dvb4ZVyk; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dvb4ZVyk"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5c66de0c24bso1127912eaf.1
        for <asahi@lists.linux.dev>; Fri, 12 Jul 2024 08:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720797161; x=1721401961; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rt88iW4L24gNZ5mfcSmKf+MLZYXAgtP2FGJ8f0TB3k0=;
        b=Dvb4ZVykft+yPsrN38pHlQohu5Uro8P8L7VjmeNpDQKGu48JFjoffHiDELRVaDs5au
         7P1LZoKIQzzjqLo22wXT8XXnASxI2GXsK7+DfM+2EtfDQGmfTw1OINgyK1611O194VS5
         iesolyC5/ZkrWTx91pW14tjdSqPKnFIq1ogNEkXBSxi/1Xr8PULGsg+ogOKikBWoVY98
         D3zhNq6mDCP5AB53P4y/nht2kLvQGgBpkOUTSpI+XokicZWxS8p1ameSqHSzj2UJntZv
         KIIhudw/2mx5lsAP+pYoiWOyK/7Bafcu53QE5aiDDCpCCi8okVDVFlp/1/uKzsE97Tnz
         5Mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720797161; x=1721401961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rt88iW4L24gNZ5mfcSmKf+MLZYXAgtP2FGJ8f0TB3k0=;
        b=tSERv+0gEGPpCmztSFYa9hLJ5srYZwE0kEjiwTY3YbkEUmXPcoz2ua9jte5z1osdqm
         jB6/+yA0CGKKvfr/lZXG9r8aUkcwG/xhe35JvgYqV/v1z66H6pl6dm+e0kiZckvk1WzB
         wMJTgd0E1HURA8yrsn3dKdu4S7xBqsiU85jWAGRBO5mML+ofC06BS1znbGSUzW0aLIhT
         mAosxM9vYLJEdw7LgoJkwcV607zjo/mBEV7T777TPibAvy5kKJDwqrm/RyJEBXKHLd4E
         W8sXn+v5DP7jZ5BqDly5qoWEgIc+vtyyIeEUmWFJsxgqy9ZKBbsfVUXO+7eM0PkFsrfS
         spSw==
X-Forwarded-Encrypted: i=1; AJvYcCWiWLgj/uptcycMKZu+Ay5ttk31wTfZ81Df/Vx75g2tW/BO7Em1283bGr8sYMrvlbnQOTXMREyvB5/00VrEpH3q+mE6iAU=
X-Gm-Message-State: AOJu0YzEwOu+dJmI8fTFp2yt0dy6gUu5WGTsdDNRQugLp8CDaJrryTIi
	tw8C7w3+fyIlzWdoVqNZ/KjRxlhmdXuWaonxeGXDv1XnI9T9pJbB2Zn1fjJBUIo=
X-Google-Smtp-Source: AGHT+IFRujCPbv+JGhve8HXrVori+HKTUQ3sHhSn4FFU8PoDISrKc47mDRc08i0zN5Rtsbb7Vo1b8A==
X-Received: by 2002:a05:6871:552:b0:25e:b6d8:5552 with SMTP id 586e51a60fabf-25eb6d8647amr8957294fac.5.1720797160737;
        Fri, 12 Jul 2024 08:12:40 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374f78d92sm1605651a34.19.2024.07.12.08.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 08:12:40 -0700 (PDT)
Date: Fri, 12 Jul 2024 10:12:38 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eric Curtin <ecurtin@redhat.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvme: apple: remove some dead code
Message-ID: <08e9da6d-fb31-4b0e-b0f5-318b0ebbf10e@suswa.mountain>
References: <124bbda3-7ccf-4e6b-b30d-7115e1c2620f@stanley.mountain>
 <CAOgh=Fx6hcJdbQpna2JJhnzp=YG_nyg-gpd=ZH7CewudtgDhAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOgh=Fx6hcJdbQpna2JJhnzp=YG_nyg-gpd=ZH7CewudtgDhAA@mail.gmail.com>

On Fri, Jul 12, 2024 at 03:29:21PM +0100, Eric Curtin wrote:
> On Fri, 12 Jul 2024 at 15:13, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > platform_get_irq() never returns zero so we can remove his dead code.
> > Checking for zero is a historical artifact from over ten years ago.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> There's quite a few return paths in platform_get_irq_optional, are we
> sure it can never be zero?
> 
> Not calling out a specific case here, but it's not so clear to me how
> we can guarantee platform_get_irq() is never zero,
> 

The platform_get_irq() function has a comment which describes how the
error handling should work.

I wrote a blog about this:
https://staticthinking.wordpress.com/2023/08/07/writing-a-check-for-zero-irq-error-codes/

TLDR; platform_get_irq() used to return zero on error but it changed
in 2006.  I believe someone told me the historical situation was
actually worse than I described where the error return wasn't always
zero but depended on the arch so sometimes it was -1...  Then after 2006
zero was success for a while because there was some hardware where zero
was a valid IRQ.  But now zero is not a valid IRQ.  I think Linus has
said that zero is a stupid IRQ number and support for that hardware was
removed.  So now it never returns zero and never will again.

There are still some xxxxxxx_get_irq() which return zero on error, and
those cause quite a bit of mixups.  Last year there was even one which
had a comment similar to platform_get_irq() that said to check for
negatives but it returned zero on failure sometimes.  :P

regards,
dan carpenter

