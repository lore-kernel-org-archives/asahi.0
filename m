Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE25391
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 16:26:46 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id w14so9660821plp.9
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 09:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=ljLPeyJn0iV7kitzqLVt7KHdOIXq5hmQNIGV4Rf22NI=;
        b=jXPLtZvYYGW1UCSKcJdgu1Qq8Dj49ejW9ZdP9CCg/hqwv1bdbEY4wPJD1MAowdz/WT
         mM3FVSjRlhXKRvZgtCo0kM6Jq41EYfJP4r27COFSuti8y26r/GuQXgSRz27GvtKrMXcT
         EaJlN9jrbiJVSc0uUm3EkTyblrXhYhEJNRnqvwEXkQ0yovmOnig8MXCGcfFMdtcjXnYj
         qVCCWsLaNimCmMXYqLQoBwhUlzvgly9FLSDRjVCyhgYtXDzF5qwRpyvIEIf9+AcJyHE4
         MG6kHbVv08KVZi1rlJGbVipz/eDBdBNBe8VMw0uoSVbnZN0TczWAdr54yVWeUH/LGbJ7
         BrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=ljLPeyJn0iV7kitzqLVt7KHdOIXq5hmQNIGV4Rf22NI=;
        b=H/H2AlFhqmvcRrMNIG/VrG8xQx4Jetj9n9xSZK5xRjyHNQvmxo68vO4kRa+HfvNS3T
         d6ZNKclZCjpGjj6amjq/Q6RiH9HOJOFMq2RSCo4RQtIl+lJ2ldHASKw0Mve//p2DDZPg
         56JHu3/csd6H7Rq69yfX4qJXcDlH2UyKZxrroObodyEpGUn9dYElE/czjFuNtZqr18Jd
         Vqr3LCJkticXCernMbnxAJGLnSFzLdkR11QNyMiHJG2gZn5FUAt7HSKdQmLrmX5PfYz0
         0UgGrXibAdXLJSe3wU20j40pOBUFBHLPI9i0gr3o75thIod6VOMCFF93axP3qF9NTnfG
         HDiQ==
X-Gm-Message-State: ACgBeo3MeLjtqcTmwrUPtMPKX4K/4RzuS3LoeYfyQ9D6xJWvMR70pMDT
	eUJ3q7nRggoa7fKeSiYXQ/U=
X-Google-Smtp-Source: AA6agR5bHivgn4E351xXewu5xhtK6GrUe9gmyfDOPVlKI+snri85TlL75sgjwzpP/K3IpUj8NJbEYA==
X-Received: by 2002:a17:902:d151:b0:172:9361:2a11 with SMTP id t17-20020a170902d15100b0017293612a11mr1044157plt.148.1660667205379;
        Tue, 16 Aug 2022 09:26:45 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:7229])
        by smtp.gmail.com with ESMTPSA id d2-20020a17090a02c200b001faae55c013sm133834pjd.52.2022.08.16.09.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:26:44 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 16 Aug 2022 06:26:43 -1000
From: Tejun Heo <tj@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, marcan@marcan.st,
	will@kernel.org, peterz@infradead.org, jirislaby@kernel.org,
	maz@kernel.org, mark.rutland@arm.com, boqun.feng@gmail.com,
	catalin.marinas@arm.com, oneukum@suse.com,
	roman.penyaev@profitbricks.com, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Message-ID: <YvvFQwBVh1s23gbR@slm.duckdns.org>
References: <YvqaK3hxix9AaQBO@slm.duckdns.org>
 <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvsZ6vObgLaDeSZk@gondor.apana.org.au>

Hello,

On Tue, Aug 16, 2022 at 12:15:38PM +0800, Herbert Xu wrote:
> Tejun Heo <tj@kernel.org> wrote:
> > 
> > Oh, tricky one and yeah you're absolutely right that it makes no sense to
> > not guarantee barrier semantics when already pending. I didn't even know
> > test_and_set_bit() wasn't a barrier when it failed. Thanks a lot for hunting
> > down and fixing this. Applied to wq/for-6.0-fixes.
> 
> Please revert this as test_and_set_bit was always supposed to be
> a full memory barrier.  This is an arch bug.

Alright, reverting.

Thanks.

-- 
tejun
