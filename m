Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC51581ED
	for <asahi@lists.linux.dev>; Fri, 31 May 2024 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717155997; cv=none; b=Dd292Ti8p03nduqiPhK0PY185PQEtv+mBhd9WspuDXfEkXA/XXf26BA7v4X/4yZSd71ASHtrKDAbzJDkG9gp/5ffw0Pvvmcg1uP2jpApZ6SFTdLL3mXIalGFpFcMUdUXjpFRR50vM/jROdMb06XrRAw7HtSaEc7HtSGhPcoDc5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717155997; c=relaxed/simple;
	bh=cZzInqUviBTYy37ASxA9p9wWZvIhStkg53piCJBUU3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Miz418d16Bc8a+dmDDSUAiB01+Dv9cv7J3fNdHWKbr+b5piWg8g5HHqP4cBxjOirUQNZq7WeyTviuzE73hBB8MP7/at3UBVQ5cd+G015Gv5wDfXUlewCUA4pekPjR1FRsqzoovEMdHfTVK5r0ekwY90J7JRwiVWqowFwD1eQ53w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TrXIcBeg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TrXIcBeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717155994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gr8k/Vm02ygPW32aJTJ9dTPWwg2hxQoQtvUykdUgDb4=;
	b=TrXIcBegqE46g06AWMeTCkztokvxDpkLJ3QQxz1gML7hdL2rnGghD5kARQyX0ev8sxfLA7
	72weEtfqY/v/suFy635u3Dvy55F+GNGYCf/jqkXVU0hOfimL95nvZbXuZqthNfHl1+vIVi
	VrBfnXD0kg/DS4HPDe0t5Ff0iLegIs0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-Vmeuy-9kOMOZOw-MZ2CKxw-1; Fri, 31 May 2024 07:46:30 -0400
X-MC-Unique: Vmeuy-9kOMOZOw-MZ2CKxw-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2bddcf62cd3so1636897a91.2
        for <asahi@lists.linux.dev>; Fri, 31 May 2024 04:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717155989; x=1717760789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gr8k/Vm02ygPW32aJTJ9dTPWwg2hxQoQtvUykdUgDb4=;
        b=NjfIt/YdTCv6GlZZivCB6GfpUMvzf1tyQJUelkUosTW0g5fJ9pbnYGaJCnG9OHKn0U
         ZGdGbirg6uZa0kdhJkNyD6Q+FzO3UCj5UkpG2HuJtCwROzguxkvExk8ELBsoNZoHVDWu
         UtxBFeve/gWQIRJ+dUr4tsGaGv7DliGgVbL0WqD0Qa2Czr5bjSQYMI81XJRZAMUJC1h9
         B1T1rkIIrnIHm619LtMM+bvrYMPY3yhVD3yi4n6y6dSM6PT6IOvfQFhVJh+YIcDmKBJq
         rsHjt2H4899IbMU50CjBblZRP2A5Ln2OTv+U+YN7s3xS4KGPo9FiBY3qYZZ5MPHaInJU
         PNcg==
X-Forwarded-Encrypted: i=1; AJvYcCU0CEwTj0ZZY5hLEW7oxlSsYjbMvGNi+8NkZ34DNfV/Hdwa6YvUphChLH9+3aQvsgj5erUpXF6JL8hd0ZO9Itcxv95iqDM=
X-Gm-Message-State: AOJu0Ywb79zJ9ABZpcsdm+kWsGTnG7/eFRIY62zMG73DtvqTh59zuTc9
	KQLP7NhtbIXHmJq6xv4MOQikkrc5UrGVN4IWf3ky9ijLXjGdXFI5pnIvmXRVG+xPVvlRHB4Vefp
	4Zl2rIcubNYIxhTkBlEwniTaeBhKpKo/P+b837rBmGxgz+EwxA97VB3vDiXOYcMR09obU00GiL5
	CpHA9mpubj+Z2mnkUBZUn3TJ/adZ4=
X-Received: by 2002:a17:90a:aa94:b0:2bd:f049:932a with SMTP id 98e67ed59e1d1-2c1dc5c8832mr1704307a91.34.1717155989414;
        Fri, 31 May 2024 04:46:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTq1sroVC/zyco89stsGzLWmiBt5HeZSFTphj0DZrCDCYOHtXNSLNxvKpXEsf8gGnY0WWV2gmiczJH02FvAx4=
X-Received: by 2002:a17:90a:aa94:b0:2bd:f049:932a with SMTP id
 98e67ed59e1d1-2c1dc5c8832mr1704291a91.34.1717155988960; Fri, 31 May 2024
 04:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240530-md-nvme-apple-v1-1-b8b7ca569660@quicinc.com>
In-Reply-To: <20240530-md-nvme-apple-v1-1-b8b7ca569660@quicinc.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Fri, 31 May 2024 12:45:53 +0100
Message-ID: <CAOgh=Fwfab2W=6QzhuBfm4fazXMnNLudSQpWw3rmX5ZcSo36yA@mail.gmail.com>
Subject: Re: [PATCH] nvme-apple: add missing MODULE_DESCRIPTION()
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 May 2024 at 06:25, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-apple.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/nvme/host/apple.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index dd6ec0865141..0cfa39361d3b 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -1602,4 +1602,5 @@ static struct platform_driver apple_nvme_driver = {
>  module_platform_driver(apple_nvme_driver);
>
>  MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
> +MODULE_DESCRIPTION("Apple ANS NVM Express device driver");
>  MODULE_LICENSE("GPL");
>
> ---
> base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
> change-id: 20240530-md-nvme-apple-e0edb9b98c45
>
>

