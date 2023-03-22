Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A721FB1
	for <asahi@lists.linux.dev>; Wed, 22 Mar 2023 14:33:40 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 97so12266832qvb.6
        for <asahi@lists.linux.dev>; Wed, 22 Mar 2023 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112; t=1679495619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+sHcsfHgkijYU4G5ArbPCjbXXNuq2j7boEZZTal/lLI=;
        b=XghRYV1zlZMg7wZOtr3HLKtiwGzuXU5LGUZU0mokJyFCwb2vqhxeJElMW5IB30ZPH6
         QLkj1fzK/z1WGZuHn31IsXjCtW/TyydK23pjN4ZByW6SGsxDTo6tsOu0MhfZ+iqDfwFr
         qyXDDLV4vKzAE2irob7OqdMhI9iec4m4IIjl8CyLHpZdJuxaqQv60J24aa4yiBGEb3cl
         wr6AhnV8c0bB3VTjN/r51jvZlCSCL44Wjugq451FtTOOq3MOLYM9LGEsL1Yo2NLVY86t
         kPONJDYGxuzrO73tZsBTgziy7qO0t3uZGrbqbTtlj0NggJhZoqp+9XeIgPGtppB62dMa
         1foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679495619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sHcsfHgkijYU4G5ArbPCjbXXNuq2j7boEZZTal/lLI=;
        b=g+lfMCsQyKU0v6sbk4MwvxniisOdgznKz4F4p7otFP3FaK6Dpsg6NfLvPVwJyu+vQA
         knFBm3OeGESDN4sNl7UoKFYWfGG/bThP3hZvtnOfk0Q7+GN/IMW9S/Qdcvdg50bI6pAJ
         4jvv40PcJWn9upBx2Ah+/OOpXQntMXgTyWsq5OyhZb/qrF1AXTTWC50MaDCPCvvrrhXz
         +yG3aniPVUye6xMpLycu1ZEUDGYnooY1MWRZMXkcNwkML0cn01gCXTUfu/48YP8Y5jKB
         B3XoFP1D9qsFZcEU4/xlLQwkt/KPqIf6NHAzEsvoVEN0ruTuDl4oOn8Deu5EwU85LZVg
         AnsA==
X-Gm-Message-State: AO0yUKVCONk66zjgkrbqodY/5xgmLQPmduQXzfeaJc0BecepXkfOxBFB
	PCxyoAALXrLxj7P3/sJD+0LyiQ==
X-Google-Smtp-Source: AK7set/rpxfvRJWHxoDmaECKeHXyJ73mNftSquU48ApyT018fkhNL2OBsNxHV9mDSOVBcA4ve/ENOQ==
X-Received: by 2002:a05:6214:234e:b0:56b:340c:ee1a with SMTP id hu14-20020a056214234e00b0056b340cee1amr6638482qvb.49.1679495619399;
        Wed, 22 Mar 2023 07:33:39 -0700 (PDT)
Received: from localhost (cpe-174-109-170-245.nc.res.rr.com. [174.109.170.245])
        by smtp.gmail.com with ESMTPSA id i4-20020a378604000000b0073b3316bbd0sm11432396qkd.29.2023.03.22.07.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:33:38 -0700 (PDT)
Date: Wed, 22 Mar 2023 10:33:38 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Neal Gompa <neal@gompa.dev>
Cc: Linux BTRFS Development <linux-btrfs@vger.kernel.org>,
	Anand Jain <anand.jain@oracle.com>,
	Qu Wenruo <quwenruo.btrfs@gmx.com>, Qu Wenruo <wqu@suse.com>,
	David Sterba <dsterba@suse.cz>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Davide Cavalca <davide@cavalca.name>, Jens Axboe <axboe@fb.com>,
	Asahi Lina <lina@asahilina.net>,
	Asahi Linux <asahi@lists.linux.dev>
Subject: Re: [RFC PATCH v2 0/1] Enforce 4k sectorize by default for mkfs
Message-ID: <20230322143338.GB2169647@perftesting>
References: <20230321180610.2620012-1-neal@gompa.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321180610.2620012-1-neal@gompa.dev>

On Tue, Mar 21, 2023 at 02:06:09PM -0400, Neal Gompa wrote:
> The Fedora Asahi SIG[0] is working on bringing up support for
> Apple Silicon Macintosh computers through the Asahi Fedora Remix[1].
> 
> Apple Silicon Macs are unusual in that they currently require 16k
> page sizes, which means that the current default for mkfs.btrfs(8)
> makes a filesystem that is unreadable on x86 PCs and most other ARM
> PCs.
> 
> Soon, this will be even more of a problem within Apple Silicon Macs
> as Asahi Lina is working on 4k support to enable x86 emulation[2]
> and since Linux does not support dynamically switching page sizes at
> runtime, users will likely regularly switch back and forth depending
> on their needs.
> 
> Thus, I'd like to see us finally make the switchover to 4k sectorsize
> for new filesystems by default, regardless of page size.
> 
> The initial test run by Hector Martin[3] at request of Qu Wenruo
> looks promising[4], and I hope we can get this to land upstream soon.
> 
> This is an update on the initial RFC patch[5], which addresses the
> documentation feedback from Anand Jain.
> 
> [0]: https://fedoraproject.org/wiki/SIGs/Asahi
> [1]: https://asahi-fedora-remix.org/
> [2]: https://vt.social/@lina/110060963422545117
> [3]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9ceca20263@suse.com/T/#m11d7939de96c43b3a7cdabc7c568d8bcafc7ca83
> [4]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9ceca20263@suse.com/T/#mf382b78a8122b0cb82147a536c85b6a9098a2895
> [5]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9ceca20263@suse.com/T/#t
> 

This all looks good to me, you can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

I've got a mac studio on the way, I'll add this to our CI testing to make sure
we've got good coverage of this code going forward.  Thanks,

Josef
