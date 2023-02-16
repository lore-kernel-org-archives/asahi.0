Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8953B747A
	for <asahi@lists.linux.dev>; Thu, 16 Feb 2023 15:13:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 728531042;
	Thu, 16 Feb 2023 07:13:58 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.28.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E87A3F703;
	Thu, 16 Feb 2023 07:13:14 -0800 (PST)
Date: Thu, 16 Feb 2023 15:13:11 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Janne Grunau <j@jannau.net>, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
	ecurtin@redhat.com, lina@asahilina.net,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	ravi.bangoria@amd.com
Subject: Re: [PATCH 1/2] arm_pmu: fix event CPU filtering
Message-ID: <Y+5IByR9RelBDm2+@FVFF77S0Q05N.cambridge.arm.com>
References: <20230216141240.3833272-1-mark.rutland@arm.com>
 <20230216141240.3833272-2-mark.rutland@arm.com>
 <20230216143519.GI17933@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216143519.GI17933@jannau.net>

On Thu, Feb 16, 2023 at 03:35:19PM +0100, Janne Grunau wrote:
> On 2023-02-16 14:12:38 +0000, Mark Rutland wrote:
> > Fix the CPU filtering by performing this consistently in
> > armpmu_filter(), and remove the redundant arm_pmu::filter() callback and
> > armv8pmu_filter() implementation.
> > 
> > Commit bd2756811766 also silently removed the CHAIN event filtering from
> > armv8pmu_filter(), which will be addressed by a separate patch without
> > using the filter callback.

[...]

> This works as well. I limited the patch to the minimal fix this                                                   
> this late in the cycle.

I did appreciate that you'd made the effort for the minimal fix; had the issue
with CHAIN events not existed I would have acked that as-is and done the
simplification later. Given the CHAIN issue and given the simplification make
the code "obviously correct" I think it's preferable to do both bits now.

> Tested-by: Janne Grunau <j@jannau.net>

Thanks!

Hopefully Will or Peter can pick this up shortly; I'm assuming that Will can
take this via the arm64 tree.

Mark.
